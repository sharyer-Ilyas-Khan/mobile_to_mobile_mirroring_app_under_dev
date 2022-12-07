import 'dart:math';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/controllers/access_screen_controller.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'dart:async';
class AccessRoomController extends GetxController {
  //TODO: Implement AccessRoomController
  Room?_room;
  var connectOptions;
  RxString? accessToken="".obs;
  final GetConnect connect=GetConnect();
  final Completer<Room> _completer = Completer<Room>();
  final AccessScreenController accessScreenController=Get.put(AccessScreenController());

  @override
  void onInit() {
    // getAccessToken();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void _onConnected(Room room) {
    print('Connected to ${room.name}');
    _completer.complete(_room);
  }

  void _onConnectFailure(RoomConnectFailureEvent event) {
    print('Failed to connect to room ${event.room.name} with exception: ${event.exception}');
    _completer.completeError(event.exception!);
  }

  Future<Room> connectToRoom() async {
    // Retrieve the camera source of your choosing
    // var cameraSources = await CameraSource.getSources();
    // var cameraCapturer = CameraCapturer(
    //   cameraSources.firstWhere((source) => source.isFrontFacing),
    // );

    connectOptions = ConnectOptions(
      accessToken!.value,
      roomName: accessScreenController.pinController.value.text,
      // region: Region.au1,                       // Optional region.
      // preferredAudioCodecs: [OpusCodec()],     // Optional list of preferred AudioCodecs
      // preferredVideoCodecs: [H264Codec()],     // Optional list of preferred VideoCodecs.
      // // audioTracks: [
      // //   // LocalAudioTrack(true)
      // // ], // Optional list of audio tracks.
      // // dataTracks: [
      // //   LocalDataTrack(
      // //     DataTrackOptions(
      // //         ordered: true,                      // Optional, Ordered transmission of messages. Default is `true`.
      // //         // maxPacketLifeTime: maxPacketLifeTime,  // Optional, Maximum retransmit time in milliseconds. Default is [DataTrackOptions.defaultMaxPacketLifeTime]
      // //         // maxRetransmits: maxRetransmits,        // Optional, Maximum number of retransmitted messages. Default is [DataTrackOptions.defaultMaxRetransmits]
      // //         name: "name"                             // Optional
      // //     ),                                // Optional
      // //   ),
      // // ], // Optional list of data tracks
      // // videoTracks:
      // //     [
      // //       LocalVideoTrack(true, cameraCapturer)
      // //     ], // Optional list of video tracks.
    );
    _room =  await TwilioProgrammableVideo.connect(connectOptions);
    _room!.onConnected.listen(_onConnected);
    _room!.onConnectFailure.listen(_onConnectFailure);
    print(" ioa ma here");
    return _completer.future;
  }

  Future<void> connectionRequest() async {
    print(accessScreenController.pinController.value.text);
    print(accessScreenController.pinController.value.text);

    connectOptions = ConnectOptions(
      accessToken!.value,
      roomName: accessScreenController.pinController.value.text,
      // region: Region.au1,                       // Optional region.
      preferredAudioCodecs: [OpusCodec()],     // Optional list of preferred AudioCodecs
      preferredVideoCodecs: [H264Codec()],     // Optional list of preferred VideoCodecs.
      // audioTracks: [
      //   // LocalAudioTrack(true)
      // ], // Optional list of audio tracks.
      dataTracks: [
        LocalDataTrack(
          DataTrackOptions(
              ordered: true,                      // Optional, Ordered transmission of messages. Default is `true`.
              // maxPacketLifeTime: maxPacketLifeTime,  // Optional, Maximum retransmit time in milliseconds. Default is [DataTrackOptions.defaultMaxPacketLifeTime]
              // maxRetransmits: maxRetransmits,        // Optional, Maximum number of retransmitted messages. Default is [DataTrackOptions.defaultMaxRetransmits]
              name: "name"                             // Optional
          ),                                // Optional
        ),
      ], // Optional list of data tracks
      // videoTracks:
      // [
      //   // LocalVideoTrack(true, cameraCapturer)
      // ], // Optional list of video tracks.
    );
    // Connect to a room.
    Room room = await TwilioProgrammableVideo.connect(connectOptions);

// ... Assume we have received the connected callback.
    room.onConnected.listen((Room room) {
      print('Connected to ${room.name}');
    });

    room.onConnectFailure.listen((RoomConnectFailureEvent event) {
      print('Failed connecting, exception: ${event.exception!.message}');
    });

    room.onDisconnected.listen((event) {
      print('Disconnected from ${event.room.name}');
    });

    room.onRecordingStarted.listen((Room room) {
      print('Recording started in ${room.name}');
    });

    room.onRecordingStopped.listen((Room room) {
      print('Recording stopped in ${room.name}');
    });

// After receiving the connected callback the LocalParticipant becomes available.
    var localParticipant = room.localParticipant;
    if(localParticipant!=null){
      print('LocalParticipant ${room.localParticipant!.identity}');
    }


// Get the first participant from the room.
    if(room.remoteParticipants.isNotEmpty){
      var remoteParticipant = room.remoteParticipants[0];
      print('RemoteParticipant ${remoteParticipant.identity} is in the room');
    }
  }

  void getAccessToken()async{
    print(accessScreenController.pinController.value.text);
    Response response=await connect.get("https://generatetoken-3593.twil.io/accesstoken?identity=${accessScreenController.pinController.value.text}");
    accessToken!.value=response.body["accessToken"];
    print(accessToken);
    await connectToRoom();


  }
}
