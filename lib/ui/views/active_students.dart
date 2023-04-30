import 'package:devtools_flutter/business/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActiveStudents extends StatefulWidget {
  const ActiveStudents({super.key});

  @override
  State<ActiveStudents> createState() => _ActiveStudentsState();
}

class _ActiveStudentsState extends State<ActiveStudents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Activists Students'),
        ),
        body: FutureBuilder(
          future: state.getStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!
                    .where((studnet) => studnet.isActivist == true)
                    .map(
                      (student) => Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(student.pic),
                          ),
                          title:
                              Text('${student.firstname} ${student.lastname}'),
                          subtitle: Text(student.average.toString()),
                          trailing: IconButton(
                            splashRadius: 20,
                            icon: student.isActivist
                                ? const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.remove_circle_outline_outlined,
                                    color: Colors.red),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 200,
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        backgroundColor: student.isActivist
                                            ? const MaterialStatePropertyAll<
                                                Color>(Colors.red)
                                            : const MaterialStatePropertyAll<
                                                Color>(Colors.green),
                                        foregroundColor:
                                            const MaterialStatePropertyAll<
                                                Color>(Colors.white),
                                      ),
                                      onPressed: () {},
                                      child: student.isActivist
                                          ? const Text('Deactivate')
                                          : const Text('Activate'),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
