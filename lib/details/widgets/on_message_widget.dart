part of on_connectivity_widget;

/// The default message widget.
class OnMessageWidget extends StatelessWidget {
  /// The message title.
  final String title;

  /// The description title.
  final String desc;

  /// The color of the message.
  final Color color;

  /// The color of the message.
  final IconData icon;

  /// The color of the message.
  final Color? iconColor;

  /// The default message widget.
  const OnMessageWidget({
    Key? key,
    required this.title,
    required this.desc,
    required this.color,
    required this.icon,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 60,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          Icon(
            icon,
            color: iconColor ?? Colors.white,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
