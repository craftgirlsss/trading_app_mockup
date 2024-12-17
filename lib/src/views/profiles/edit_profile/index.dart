import 'package:flutter/material.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/components/textfields/text_form_field.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController ttl = TextEditingController();
  TextEditingController identityType = TextEditingController();
  TextEditingController identityNumber = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController taxValidDate = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController houseStatus = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController relationshipName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    gender.dispose();
    country.dispose();
    ttl.dispose();
    identityType.dispose();
    identityNumber.dispose();
    taxNumber.dispose();
    taxValidDate.dispose();
    address.dispose();
    province.dispose();
    city.dispose();
    birthPlace.dispose();
    houseStatus.dispose();
    motherName.dispose();
    maritalStatus.dispose();
    relationshipName.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: GlobalAppBar.defaultAppBar(
          title: "Detail Profile",
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage('assets/icons/ic_launcher.png'),
                  onBackgroundImageError: (exception, stackTrace) => const Icon(Icons.error_rounded),
                ),
                Text("Ubah Foto Profil", style: GlobalTextStyle.defaultTextStyle(fontSize: 11)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GlobalButtons.defaultOutlinedButton(
                          onPressed: (){},
                          outlineColor: Colors.black,
                          titleColor: Colors.black,
                          fontWeight: FontWeight.normal,
                          title: "Simpan Perubahan"
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GlobalButtons.defaultOutlinedButton(
                          onPressed: (){},
                          fontWeight: FontWeight.normal,
                          outlineColor: Colors.black,
                          titleColor: Colors.black,
                          title: "Upgrade Akun"
                        ),
                      ),
                    ],
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: ExpansionTile(
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.black12,
                          width: 0.5,
                          style: BorderStyle.solid
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.black12,
                          width: 0.5,
                          style: BorderStyle.solid
                        )
                      ),
                      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                      title: Text("Informasi Pribadi", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      backgroundColor: Colors.white,
                      iconColor: Colors.black,
                      collapsedBackgroundColor: Colors.white38,
                      children: [
                        CustomTextFormField(controller: name, hintText: "Nama Lengkap", readOnly: true),
                        CustomTextFormField(controller: email, hintText: "Email", readOnly: true),
                        CustomTextFormField(controller: gender, hintText: "Jenis Kelamin", readOnly: true),
                        CustomTextFormField(controller: country, hintText: "Warga Negara", readOnly: true),
                        CustomTextFormField(controller: name, hintText: "Tempat & Tanggal Lahir", readOnly: true),
                        CustomTextFormField(controller: email, hintText: "Jenis Identitas", readOnly: true),
                        CustomTextFormField(controller: gender, hintText: "No. Identitas", readOnly: true),
                        CustomTextFormField(controller: taxNumber, hintText: "No. NPWP NIK", readOnly: true),
                        CustomTextFormField(controller: taxValidDate, hintText: "Masa Berlaku", readOnly: true),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomTextFormField(controller: address, hintText: "Alamat Sesuai ID", readOnly: true),
                                  CustomTextFormField(controller: province, hintText: "Provinsi", readOnly: true),
                                  CustomTextFormField(controller: country, hintText: "Negara", readOnly: true),
                                ],
                              )
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextFormField(controller: city, hintText: "Kota", readOnly: true),
                            )
                          ],
                        ),
                        CustomTextFormField(controller: houseStatus, hintText: "Status Kepemilikan Rumah", readOnly: true),
                        CustomTextFormField(controller: motherName, hintText: "Nama Ibu Kandung", readOnly: true),
                        CustomTextFormField(controller: maritalStatus, hintText: "Status Perkawinan", readOnly: true),
                        CustomTextFormField(controller: relationshipName, hintText: "Nama Suami/Istri", readOnly: true),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text("Document", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text("Informasi Pekerjaan", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text("Informasi Keuangan", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black12,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text("Pihak yang dapat dihubungi dalam keadaan darurat", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}