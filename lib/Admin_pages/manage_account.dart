import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/create_Account.dart';
import 'package:med_intern/accept_account.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class ManageAccounts extends StatefulWidget {
  const ManageAccounts({super.key});

  @override
  State<ManageAccounts> createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ManageAccounts> {
  @override
  Widget build(BuildContext context) {
    DeleteAccount() {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Delete message',
        desc: 'Are you sure you want to delete this account?',
        btnOkColor: maincolor,
        btnCancelColor: Colors.red,
        btnOkOnPress: () {},
        btnCancelOnPress: () {},
      ).show();
    }

    TextEditingController search = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: subcolor),
                  ),
                ),
                child: Text(
                  'Manage Account',
                  style: sub_deepgreen_bold,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search By Name Or ID Number',
                      style: med_deepgreen_title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                        suf_icon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: subcolor,
                          ),
                        ),
                        controller: search,
                        text: '',
                        textInputType: TextInputType.text,
                        obscure: false,
                        color: Colors.white,
                        height: 50,
                        width: double.infinity),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 13),
                        decoration: BoxDecoration(
                          color: light_box_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    'name',
                                    style: small_dark_grey_title,
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    'nour',
                                    style: med_white_bold,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    'ID',
                                    style: small_dark_grey_title,
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    '022333221',
                                    style: med_white_bold,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'edit',
                                    style: small_dark_grey_title,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('editaccount');
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: subcolor,
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'delete',
                                    style: small_dark_grey_title,
                                  ),
                                  IconButton(
                                    onPressed: DeleteAccount,
                                    icon: const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 118, 27, 21),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
              Row(
                children: [
                  Center(
                    child: RecButton(
                        fun: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return createAccount();
                            },
                          ));
                        },
                        label: Text(
                          "Add Account",
                          style: small_white_title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: 160,
                        height: 50,
                        color: maincolor),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Center(
                    child: RecButton(
                        fun: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return AcceptAccounts();
                            },
                          ));
                        },
                        label: Text(
                          "accept accounts",
                          style: small_white_title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: 160,
                        height: 50,
                        color: maincolor),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
