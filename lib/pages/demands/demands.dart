import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hemobile/models/blood_center_model.dart';
import 'package:hemobile/pages/demands/donate.dart';

class DemandsPage extends StatefulWidget {
  @override
  _DemandsPageState createState() => _DemandsPageState();
}

class _DemandsPageState extends State<DemandsPage> {
  List<BloodCenterModel> bloodCentersList = [];
  bool _loading = true;

  _doAsync() async {
    final response =
        await Dio().get('https://hemobile.herokuapp.com/blood-centers');

    setState(() {
      bloodCentersList = (response.data as List)
          .map((x) => BloodCenterModel.fromJson(x))
          .toList();

      _loading = false;
    });
  }

  @override
  initState() {
    _doAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
        ),
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
                DemandsHeader(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return BloodCenterTile(
                        bloodCenter: bloodCentersList[index],
                      );
                    },
                    itemCount: bloodCentersList.length,
                  ),
                )
              ],
            ),
    );
  }
}

class BloodCenterTile extends StatelessWidget {
  final BloodCenterModel bloodCenter;

  const BloodCenterTile({
    Key? key,
    required this.bloodCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.location_city,
        color: Theme.of(context).accentColor,
      ),
      title: Text(bloodCenter.name),
      subtitle: Text(bloodCenter.address),
      trailing: Icon(
        Icons.arrow_right,
        color: Theme.of(context).accentColor,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DonatePage(bloodCenter: bloodCenter)),
        );
      },
    );
  }
}

class DemandsHeader extends StatelessWidget {
  const DemandsHeader({
    Key? key,
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
              'Principais demandas',
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
