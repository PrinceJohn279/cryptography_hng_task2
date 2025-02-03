import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

// Created a stateful widget for encryption and decryption
class CryptingWidget extends StatefulWidget {
  const CryptingWidget({super.key});
  @override
  CryptingWidgetState createState() => CryptingWidgetState();
}

class CryptingWidgetState extends State<CryptingWidget> {
  // Intoduced the encryption key and initialization vector-IV
  final key = encrypt.Key.fromLength(32);
  final iv = encrypt.IV.fromLength(16);

  // this line here creates an encrypter instance using AES algorithm
  final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(32)));

  // Variables to store encrypted and decrypted values
  String encryptedText = '';
  String decryptedText = '';

  // this method is used to encrypt the input text
  void _encrypt(String text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    setState(() {
      encryptedText = encrypted.base64;
    });
  }

  // this method is used to decrypt the encrypted text
  void _decrypt(String text) {
    final decrypted = encrypter.decrypt64(text, iv: iv);
    setState(() {
      decryptedText = decrypted;
    });
  }

  // UI of the widget is built here
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Add padding around the widget
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text field for entering text to encrypt
          TextFormField(
            onChanged: (text) {
              _encrypt(text);
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.enhanced_encryption),
                labelText: 'Enter text to encrypt'),
          ),
          SizedBox(height: 20),
          // Display the encrypted text
          Text(
            'Encrypted: $encryptedText',
            style: TextStyle(color: Colors.deepPurple),
          ),
          SizedBox(height: 20),
          // Button to decrypt encrpted text
          ElevatedButton(
            onPressed: () {
              _decrypt(encryptedText);
            },
            child: Text('Decrypt'),
          ),
          SizedBox(height: 20),
          // Display the decrypted text
          Text('Decrypted: $decryptedText',
              style: TextStyle(color: Colors.blueAccent)),
        ],
      ),
    );
  }
}
