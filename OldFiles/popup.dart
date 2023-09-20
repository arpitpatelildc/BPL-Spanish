// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget({
//     @required this.text,
//     @required this.onClicked,
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => RaisedButton(
//     child: Text(
//       text,
//       style: TextStyle(fontSize: 24),
//     ),
//     shape: StadiumBorder(),
//     color: Theme.of(context).accentColor,
//     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     textColor: Colors.white,
//     onPressed: onClicked,
//   );
// }
//
//
// class PopupInfo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => ButtonWidget(
//     text: 'Custom Dialog',
//     onClicked: () => showCustomDialog(context),
//   );
//
//   void showCustomDialog(BuildContext context) => showDialog(
//     context: context,
//     barrierDismissible: false,
//     child: Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 12),
//             Text(
//               'This is a Custom Dialog',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'You get more customisation freedom in this type of dialogs',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 12),
//             ElevatedButton(
//               child: Text('Close'),
//               onPressed: () => Navigator.of(context).pop(),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }