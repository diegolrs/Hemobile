import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hemobile/models/blood_center_model.dart';
import 'package:hemobile/models/demand_model.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class DonatePage extends StatefulWidget {
  final BloodCenterModel bloodCenter;

  const DonatePage({Key? key, required this.bloodCenter}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final LocalStorage _userStorage = new LocalStorage('user_data');

  List<DemandModel> demandsList = [];
  bool _loading = true;
  bool _appoitmentLoading = false;
  late UserModel user;

  _initAsync() async {
    final userStorage = _userStorage.getItem('user');

    final response = await Dio().get(
        'https://hemobile.herokuapp.com/blood-centers/${widget.bloodCenter.uuid}');

    setState(() {
      user = UserModel.fromJson(userStorage);

      demandsList = (response.data['demands'] as List)
          .map((x) => DemandModel.fromJson(x))
          .toList();

      _loading = false;
    });
  }

  @override
  initState() {
    _initAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        shadowColor: Colors.transparent,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).accentColor,
              ),
            )
          : Column(
              children: [
                DemandsHeader(
                  bloodCenterName: widget.bloodCenter.name,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final demand = demandsList[index];

                      return ListTile(
                        leading: Icon(Icons.bloodtype,
                            color: Theme.of(context).accentColor),
                        title: Text(
                          "Tipo ${demand.bloodType}",
                        ),
                        subtitle:
                            Text("${demand.collected}/${demand.requested}"),
                      );
                    },
                    itemCount: demandsList.length,
                  ),
                ),
                Container(
                  width: 900,
                  height: 100,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor),
                    ),
                    child: _appoitmentLoading
                        ? CircularProgressIndicator(
                            color: Theme.of(context).accentColor,
                          )
                        : Text(
                            'DOAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                    onPressed: () async {
                      setState(() {
                        _appoitmentLoading = true;
                      });
                      await Dio().post(
                          'https://hemobile.herokuapp.com/donations',
                          data: {
                            "bloodCenterUuid": widget.bloodCenter.uuid,
                            "userUuid": user.uuid,
                          });
                      setState(() {
                        _appoitmentLoading = false;
                      });
                      Navigator.pushNamed(context, '/schedules');
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class DemandsHeader extends StatelessWidget {
  final String bloodCenterName;

  const DemandsHeader({
    Key? key,
    required this.bloodCenterName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 150,
      child: Column(
        children: [
          Icon(
            Icons.bloodtype,
            size: 70,
            color: Theme.of(context).accentColor,
          ),
          Expanded(
            child: Text(
              '$bloodCenterName',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
