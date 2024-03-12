SizedBox(
  width: double.infinity,
  child: Card(
    margin: const EdgeInsets.all(20),
    elevation: 10,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            'Task 4',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.3,
          ),
          // increment and decrement buttons
          ListTile(
            
            title: Center(child: Text('$task4Number')),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                onPressed: () {
                  increment();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            trailing: CircleAvatar(
              backgroundColor: (task4Number < 1)? Colors.black12 :Colors.red,
              child: IconButton(
                onPressed: task4Number >= 1 ? decrement : null,
                icon: Icon(
                  Icons.remove,
                  color: (task4Number < 1)? Colors.black :Colors.white,
                ),
              ),
            )
            
          )
        ],
      ),
    ),
  ),
),
