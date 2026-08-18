import 'package:aula_913/domain/services.dart';
import 'package:flutter/material.dart';

class ServiceContainer extends StatefulWidget {
  Services services;

  ServiceContainer({super.key, required this.services});

  @override
  State<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  @override
  Widget build(BuildContext context) {
    padding:
    EdgeInsets.symmetric(horizontal: 30);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF282829),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 18),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.services.name,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.services.description,
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.network(
                widget.services.image,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}