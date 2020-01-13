import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key key}) : super(key: key);

  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  //记录选择的照片
  File _image;

  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;

  File _video;

  VideoPlayerController _videoPlayerController;

  ChewieController _chewieController;

  @override

  void initState() {

    super.initState();

    /*_videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:
      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,

    );*/
  }

  //拍摄视频
  Future _getVideoFromCamera() async{

    File video = await ImagePicker.pickVideo(source: ImageSource.camera);

    if(mounted)
      setState(() {
        _video = video;
        if(_chewieController!=null) _chewieController.dispose();
        if(_videoPlayerController!=null&&_videoPlayerController.value.isPlaying) _videoPlayerController.pause();
        _videoPlayerController = VideoPlayerController.file(video);
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true,
          // Try playing around with some of these other options:
          // showControls: false,
          // materialProgressColors: ChewieProgressColors(
          //   playedColor: Colors.red,
          //   handleColor: Colors.blue,
          //   backgroundColor: Colors.grey,
          //   bufferedColor: Colors.lightGreen,
          // ),
          // placeholder: Container(
          //   color: Colors.grey,
          // ),
          // autoInitialize: true,
        );

        _chewieController.play();
      });
  }

  //本地视频
  Future _getVideoFromLocal() async {
    // Will let you pick one file path, from all extensions
    File video = await FilePicker.getFile(type: FileType.VIDEO);

    setState(() {
      _video = video;
      if(_chewieController!=null) _chewieController.dispose();
      if(_videoPlayerController!=null&&_videoPlayerController.value.isPlaying) _videoPlayerController.pause();
      _videoPlayerController = VideoPlayerController.file(video);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        // Try playing around with some of these other options:
        // showControls: false,
        // materialProgressColors: ChewieProgressColors(
        //   playedColor: Colors.red,
        //   handleColor: Colors.blue,
        //   backgroundColor: Colors.grey,
        //   bufferedColor: Colors.lightGreen,
        // ),
        // placeholder: Container(
        //   color: Colors.grey,
        // ),
        // autoInitialize: true,
      );

      _chewieController.play();
    });
  }

  //拍照
  Future _getImageFromCamera() async {
    File image =
    await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 100);
    image.length().then((value){
      print(value);
    });
    setState(() {
      _image = image;
    });
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  //上传图片到服务器
  _uploadImage() async {
    Dio dio = new Dio();
    dio.interceptors.add(CookieManager(CookieJar()));//保持session/token等头部信息
    Response response = await dio.post("http://192.168.31.108:71/Userservice/register", data:
    {"sw":"o6Sv",
      "sh":"oKOu",
      "sp":2.0000000298,
      "gv":"wfP00dq2p7imtr7Z5vP40dq208W2pLimttX-5Pn7_-P7vw",
      "gr":"19jR2tO2vt_44vP6vsS_tsPe0rbR5Pfm_v_15bagpKa20v_k8_XipdKnp7bg5cmjyaa25uXJo8mmvw",
      "du":"oaanp_Cv9KDy8qbypqb08A"}
    );
    print(response.data);
    print(response.headers);
    var result = jsonDecode(response.data.toString());//解析jason
    if(result["resultCode"]==0){
      FormData formData = new FormData.fromMap({
        "title": "11111111111111111111",
        "tags": '56,54',
        'accept': 1,
        'class': 12,
        'gold': 0,
        "fileimg": await MultipartFile.fromFile(_image.path,filename: "upload.png"),
        "filevideo": await MultipartFile.fromFile(_video.path,filename: "upload.mp4"),
      });
      response = await dio.post("http://192.168.31.108:71/Videoservice/upload", data: formData);
      print(response.data);
    }


    /*FormData formData = FormData.fromMap({
      //"": "", //这里写其他需要传递的参数
      //"file": UploadFileInfo(_image, "imageName.png"),
      "fileimg": await MultipartFile.fromFile(_image.path, filename: "xx.png"),
    });
    print(formData);
    var response = await Dio().post("http://192.168.31.108:71/Videoservice/upload", data: formData);
    print(response);
    if (response.statusCode == 200) {
      Map responseMap = response.data;
      //print("http://jd.itying.com${responseMap["path"]}");
      setState(() {
        //_imgServerPath = "http://jd.itying.com${responseMap["path"]}";
      });
    }*/
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("选择图片并上传")),
      body: Container(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _getVideoFromCamera();
              },
              child: Text("拍视频"),
            ),
            SizedBox(height: 10),

            RaisedButton(
              onPressed: () {
                _getVideoFromLocal();
              },
              child: Text("视频文件"),
            ),
            SizedBox(height: 10),
            Center(
              child: _chewieController==null?Container():
              Chewie(
                controller: _chewieController,
              ),
            ),
            SizedBox(height: 10),

            RaisedButton(
              onPressed: () {
                _getImageFromCamera();
              },
              child: Text("照相机"),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                _getImageFromGallery();
              },
              child: Text("相册"),
            ),
            SizedBox(height: 10),
            /**
             * 展示选择的图片
             */
            _image == null
                ? Text("no image selected")
                : Image.file(
              _image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                _uploadImage();
              },
              child: Text("上传图片到服务器"),
            ),
            SizedBox(height: 10),
            _imgServerPath == null
                ? Text("没有上传图片")
                : Image.network(
                "http://jd.itying.com/public/upload/daoyXVTvrCCUeoIliZtNXX-s.png"),
          ],
        ),
      ),
    );
  }
}