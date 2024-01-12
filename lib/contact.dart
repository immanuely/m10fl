import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class contactScreen extends StatefulWidget {
  const contactScreen({super.key});

  @override
  State<contactScreen> createState() => _contactScreenState();
}

class _contactScreenState extends State<contactScreen> {
  var _contacts;

  Future<void> getContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    print(contacts);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('contact'),
        ),
        body: _contacts != null && _contacts.length != 0
            ? ListView.builder(
                itemCount: _contacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact? contact = _contacts?.elementAt(index);
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    leading:
                        (contact?.avatar != null && contact!.avatar!.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar!),
                              )
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(contact!.initials()),
                              ),
                    title: Text(contact.displayName ?? ''),
                  );
                },
              )
            : Center(
                child: Text('kontak kosong'),
              ));
  }
}
