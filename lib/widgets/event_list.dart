import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/color/colors.dart';

import '../models/event.dart';

class EventList extends StatelessWidget {
  final List<Event> event;
  final Function deleteEvent;

  EventList(this.event, this.deleteEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: event.isEmpty
          ? Container(
              alignment: Alignment(0.0, -0.3),
              child: Text(
                'No event added yet!',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.blueGrey,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => deleteEvent(event[index].id),
                      ),
                    ],
                  ),
                );
              },
              itemCount: event.length,
            ),
    );
  }
}