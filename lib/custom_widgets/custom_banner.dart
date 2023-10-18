import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';

// class CustomBanner extends StatelessWidget {
//   const CustomBanner({
//     super.key,
//     required this.height,
//     required this.width,
//   });
//
//   final double height;
//   final double width;
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQuery.of(context).size.width * 0.7;
//     return Container(
//       width: width,
//       height: height,
//     );
//   }
// }

///
class ImageContainerWithTextButton extends StatelessWidget {
  const ImageContainerWithTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      //color: Colors.grey,
      child:

          Padding(
            padding: const EdgeInsets.fromLTRB(15,10,0,10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'New Collection',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  //strutStyle: StrutStyle(forceStrutHeight: true),
                  style: TextStyle(
                    fontSize: 22.0,

                    // Adjust the font size as needed
                    color: AppColors.primary, // Adjust the text color as needed
                  ),
                ),
                const SizedBox(height: 10.0),

                const Text(
                  'Discount 50% for the first order',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(forceStrutHeight: true),
                  style: TextStyle(
                    fontSize: 17.0, // Adjust the font size as needed
                    color: AppColors.textGray2, // Adjust the text color as needed
                  ),
                ),
                // Add spacing between text and button
                Spacer(),
                ElevatedButton(

                  onPressed: () {
                    // Add your button's onPressed logic here
                  },
                  child: const Text('Shop Now'),
                ),
              ],
            ),
          ),


         // SizedBox.shrink(),

    );
  }
}
