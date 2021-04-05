part of on_connectivity_widget;

/// Used as default mobile widget.
class OnMobileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      height: 60,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          Container(
            color: Colors.white,
            height: 40,
            width: 5,
          ),
          SizedBox(width: 30),
          Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You're online",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Your current connection is: Mobile",
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
