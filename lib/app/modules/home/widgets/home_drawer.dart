import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/theme_extension.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  final nameVN = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: context.primaryColor.withAlpha(70)),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        'https://cdn-images-1.medium.com/max/1024/0*vowtRZE_wvyVA7CB';
                  },
                  builder: (_, value, __) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30,
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      selector: (context, authProvider) {
                        return authProvider.user?.displayName ??
                            'Nome não definido';
                      },
                      builder: (_, value, __) {
                        return Text(
                          value,
                          style: context.textTheme.subtitle2,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Alterar nome'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Alterar nome'),
                    content: TextField(
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                          onPressed: (() => Navigator.of(context).pop()),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          )),
                      TextButton(
                          onPressed: (() async {
                            final displayName = nameVN.value;
                            if (displayName.isEmpty) {
                              Messages.of(context)
                                  .showError('Informe um nome válido');
                            } else if (displayName.length > 26) {
                              Messages.of(context).showError(
                                  'O nome não pode conter mais que 26 caracteres');
                            } else {
                              Loader.show(context);
                              await context
                                  .read<UserService>()
                                  .updateDisplayName(displayName);
                              Loader.hide();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            }
                          }),
                          child: const Text('Salvar'))
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () => context.read<AuthProvider>().logout(),
          )
        ],
      ),
    );
  }
}
