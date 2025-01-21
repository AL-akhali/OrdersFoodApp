import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/address/view_address_controller.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/data/model/addressmodel.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("74".tr)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressAdd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<ViewAddressController>(
          builder: (controller) => HandlingData(
            statusRequest: controller.statusRequest,
            widget: Container(
                child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(addressModel: controller.data[index]);
              },
            )),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  const CardAddress({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
            "${addressModel.addressCity!} -- ${addressModel.addressStreet!} -- ${addressModel.addressDetails!}",
          ),
        ),
      ),
    );
  }
}
