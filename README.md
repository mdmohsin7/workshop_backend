A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).


# Running the sample

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

Step 1: Clone the Repository

Step 2: Open a terminal (Command Prompt on Windows) and navigate to the workshop_backend directory in it.<br />
Example: If you cloned the repository on desktop and you have a folder named workshop_backend. Then open Command Prompt and type in `cd Desktop/workshop_backend`

Step 3: Run the below command

```
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://127.0.0.1:8080
Hello, World!

$ curl http://127.0.0.1:8080/up
I am up

$ curl http://127.0.0.1:8080/getAllergiesList
['Peanuts','Tree Nuts','Milk','Eggs','Wheat','Soy','Fish','Shellfish']

$ curl http://127.0.0.1:8080/canCauseAllergy
{
    "causesAllergy": true,
    "allergyName": "Peanuts"
}
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!

$ curl http://0.0.0.0:8080/up
I am up

$ curl http://0.0.0.0:8080/getAllergiesList
['Peanuts','Tree Nuts','Milk','Eggs','Wheat','Soy','Fish','Shellfish']

$ curl http://0.0.0.0:8080/canCauseAllergy
{
    "causesAllergy": true,
    "allergyName": "Peanuts"
}
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```
