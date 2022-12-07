import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/controllers/share_screen_controller.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
class CreateRoomController extends GetxController {
  //TODO: Implement CreateRoomController
  Room? _room;
   RxString? accessToken="".obs;
  final Completer<Room> _completer = Completer<Room>();
   String roomCode="";
  final GetConnect connect=GetConnect();
  final ShareScreenController controller=Get.put(ShareScreenController());
  var connectOptions;
  @override
  void onInit() {
    generateRoomCode();
    getAccessToken();
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
    var cameraSources = await CameraSource.getSources();
    var cameraCapturer = CameraCapturer(
      cameraSources.firstWhere((source) => source.isFrontFacing),
    );

     connectOptions = ConnectOptions(
      accessToken!.value,
      roomName: roomCode,                   // Optional name for the room
      // region: region,                       // Optional region.
      preferredAudioCodecs: [OpusCodec()],  // Optional list of preferred AudioCodecs
      preferredVideoCodecs: [H264Codec()],  // Optional list of preferred VideoCodecs.
      // audioTracks: [LocalAudioTrack(true)], // Optional list of audio tracks.
      dataTracks: [
        LocalDataTrack(
          DataTrackOptions(
              ordered: true,                      // Optional, Ordered transmission of messages. Default is `true`.
              // maxPacketLifeTime: maxPacketLifeTime,  // Optional, Maximum retransmit time in milliseconds. Default is [DataTrackOptions.defaultMaxPacketLifeTime]
              // maxRetransmits: maxRetransmits,        // Optional, Maximum number of retransmitted messages. Default is [DataTrackOptions.defaultMaxRetransmits]
              name: "name"                             // Optional
          ),                                // Optional
        ),
      ],                                    // Optional list of data tracks
      videoTracks: [LocalVideoTrack(true, cameraCapturer)], // Optional list of video tracks.
    );
    _room = await TwilioProgrammableVideo.connect(connectOptions);
    _room!.onConnected.listen(_onConnected);
    _room!.onConnectFailure.listen(_onConnectFailure);
    return _completer.future;
  }


  Future<void> connectionRequest() async {
     connectOptions = ConnectOptions(
      accessToken!.value,
      roomName:roomCode,                   // Optional name for the room
      // region: region,                       // Optional region.
      preferredAudioCodecs: [OpusCodec()],  // Optional list of preferred AudioCodecs
      preferredVideoCodecs: [H264Codec()],  // Optional list of preferred VideoCodecs.
      // audioTracks: [LocalAudioTrack(true)], // Optional list of audio tracks.
      dataTracks: [
        LocalDataTrack(
          DataTrackOptions(
              ordered: true,                      // Optional, Ordered transmission of messages. Default is `true`.
              // maxPacketLifeTime: maxPacketLifeTime,  // Optional, Maximum retransmit time in milliseconds. Default is [DataTrackOptions.defaultMaxPacketLifeTime]
              // maxRetransmits: maxRetransmits,        // Optional, Maximum number of retransmitted messages. Default is [DataTrackOptions.defaultMaxRetransmits]
              name: "name"                             // Optional
          ),                                // Optional
        ),
      ],                                    // Optional list of data tracks
      // videoTracks: [LocalVideoTrack(true, cameraCapturer)], // Optional list of video tracks.
    );
    // Connect to a room.
    Room room = await TwilioProgrammableVideo.connect(connectOptions);

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

// ... Assume we have received the connected callback.

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

  void generateRoomCode(){
    String code=(Random().nextInt(4000)+1000).toString();
    controller.pinController.value.text=code;
    roomCode=code;
  }

  void getAccessToken()async{
    print(roomCode);
    Response response=await connect.get("https://generatetoken-3593.twil.io/accesstoken?identity=$roomCode");
    accessToken!.value=response.body["accessToken"];
    if(accessToken!.value!=""){
      // connectionRequest();
     await connectToRoom();
    }

  }

}
