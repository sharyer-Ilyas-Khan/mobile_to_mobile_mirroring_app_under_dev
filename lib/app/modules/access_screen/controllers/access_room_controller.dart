import 'dart:math';

import 'package:get/get.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'dart:async';
class AccessRoomController extends GetxController {
  //TODO: Implement AccessRoomController
  Room?_room;
  var connectOptions;
  final Completer<Room> _completer = Completer<Room>();

  @override
  void onInit() {
    generateRoomCode();
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

    var connectOptions = ConnectOptions(
      "accessToken",
      roomName: "roomName",
      region: Region.au1,                       // Optional region.
      preferredAudioCodecs: [OpusCodec()],     // Optional list of preferred AudioCodecs
      preferredVideoCodecs: [H264Codec()],     // Optional list of preferred VideoCodecs.
      audioTracks: [
        // LocalAudioTrack(true)
      ], // Optional list of audio tracks.
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
      videoTracks:
          [
            LocalVideoTrack(true, cameraCapturer)
          ], // Optional list of video tracks.
    );
    _room = await TwilioProgrammableVideo.connect(connectOptions);
    _room!.onConnected.listen(_onConnected);
    _room!.onConnectFailure.listen(_onConnectFailure);
    return _completer.future;
  }
  Future<void> connectionRequest() async {
    // Connect to a room.
    Room room = await TwilioProgrammableVideo.connect(connectOptions);
    print("this.is is is room connect");
    print(room.onConnected);

    // room.onConnectFailure((RoomConnectFailureEvent event) {
    //   print('Failed connecting, exception: ${event.exception.message}');
    // });
    //
    // room.onDisconnected((RoomDisconnectEvent event) {
    //   print('Disconnected from ${event.room.name}');
    // });
    //
    // room.onRecordingStarted((Room room) {
    //   print('Recording started in ${room.name}');
    // });
    //
    // room.onRecordingStopped((Room room) {
    //   print('Recording stopped in ${room.name}');
    // });

// ... Assume we have received the connected callback.

// After receiving the connected callback the LocalParticipant becomes available.
    var localParticipant = room.localParticipant;
    print('LocalParticipant ${room.localParticipant!.identity}');

// Get the first participant from the room.
    var remoteParticipant = room.remoteParticipants[0];
    print('RemoteParticipant ${remoteParticipant.identity} is in the room');
  }
  String generateRoomCode(){
    String code=Random().nextInt(4000).toString();
    print(code);

    return code;
  }
}
