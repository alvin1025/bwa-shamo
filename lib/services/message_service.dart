import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneakerz/models/message_model.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // menampilkan message
  Stream<List<MessageModel>?> getMessagesByUserId({int? userId}) {
    
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
            var result = list.docs.map<MessageModel>((DocumentSnapshot message){
              print(message.data());
              return MessageModel.fromJson(message.data()!);
            }).toList();

            result.sort(
              (MessageModel a, MessageModel b) => (a.createdAt!).compareTo(b.createdAt!),
            );

          });
    } catch (e) {
      throw Exception(e);
    }

  }

  Future<void> addMessage(
      {UserModel? user,
      bool? isFromUser,
      String? message,
      ProductModel? product}) async {
    firestore.collection('message').add({
      'userId': user?.id,
      'userName': user?.name,
      'userImage': user?.profilePhotoUrl,
      'isFromUser': isFromUser,
      'message': message,
      'product': product is UninitializedProductModel ? {} : product?.toJson(),
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
    }).then((value) => print('Pesan Berhasil Dikirim!'));

    try {} catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
