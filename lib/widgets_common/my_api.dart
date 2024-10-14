import 'package:first_flutter/consts/consts.dart';

Widget myApiWidget({dynamic response}){
  return FutureBuilder(
    future: response,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data[index]['name']['title'] +
                        " " +
                        snapshot.data[index]['name']['first'] +
                        " " +
                        snapshot.data[index]['name']['last']),
                    trailing:
                        Text(snapshot.data[index]['dob']['age'].toString()),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index]['picture']['large'],
                      ),
                    ),
                    subtitle: Text(snapshot.data[index]['email']),
                  )
                ],
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

