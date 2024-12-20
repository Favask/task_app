import 'package:flutter/material.dart';
import 'package:profile_app/presentation/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return Drawer(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(provider.loginResponse?.image ?? ""),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(provider.userName ?? "", style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                    const Divider(),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text(provider.loginResponse?.position ?? ""),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.format_list_numbered_rtl_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text(provider.loginResponse?.numberOfTasks.toString() ?? ""),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.incomplete_circle,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text("${provider.loginResponse?.percentage.toString() ?? ""} %"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: const Text('Logout'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.80,
                  child: Text('Version  1.00', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
