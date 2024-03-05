import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   final List<Order> orderList = [
//     Order(
//       status: 'Order Placed',
//       details: 'Your order has been placed successfully.',
//       date: '2024-01-13',
//     ),
//     Order(
//       status: 'Processing',
//       details: 'We are currently processing your order.',
//       date: '2024-01-14',
//     ),
//     Order(
//       status: 'Shipped',
//       details: 'Your order has been shipped.',
//       date: '2024-01-15',
//     ),
//     Order(
//       status: 'Delivered',
//       details: 'Your order has been delivered.',
//       date: '2024-01-16',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OrderTrackerPage(orderList: orderList),
//     );
//   }
// }
//
// class OrderTrackerPage extends StatelessWidget {
//   final List<Order> orderList;
//
//   OrderTrackerPage({required this.orderList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Tracker'),
//       ),
//       body: ListView(
//         children: orderList.map((order) => TimelineItem(order: order)).toList(),
//       ),
//     );
//   }
// }
//
// class TimelineItem extends StatelessWidget {
//   final Order order;
//
//   TimelineItem({required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: ExpansionTile(
//         title: ListTile(
//           contentPadding: EdgeInsets.all(15),
//           title: Text(order.status),
//           subtitle: Text('Date: ${order.date}'),
//           leading: CircleAvatar(
//             child: Text((orderList.indexOf(order) + 1).toString()),
//           ),
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Text(order.details),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

// class OrderTrackingScreen extends StatelessWidget {
//   final List<OrderStatus> orderStatusList = [
//     OrderStatus("Order Placed", "2024-01-17 13:52:22"),
//     OrderStatus("Payment Confirmed", "2024-01-17 14:00:00"),
//     OrderStatus("Order Processed", "2024-01-17 14:30:00"),
//     OrderStatus("Out for Delivery", "2024-01-17 15:15:00"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold();
