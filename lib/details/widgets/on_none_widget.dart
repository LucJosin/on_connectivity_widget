part of on_connectivity_widget;

/// Used as default none widget.
class OnNoneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[900],
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
            Icons.warning_amber_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You're offline",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Your current connection is: offline",
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
