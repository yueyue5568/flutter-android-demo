import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterAndroidApp());
}

class GroupFlutterAndroidApp extends StatelessWidget {
  const GroupFlutterAndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Android 真机运行展示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TeamAndroidHomePage(),
    );
  }
}

class TeamAndroidHomePage extends StatelessWidget {
  const TeamAndroidHomePage({super.key});

  static const String projectTitle = '小组 Android 真机运行展示';
  static const String projectSlogan = '用 GitHub 协作完成一次 Flutter 应用真机运行 —— 陈嘉玲';
  static const String deviceProof = '最终证据：用第二部手机拍摄手持 Android 真机运行照片，并加入 GitHub README。';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '王怡婷', task: '创建仓库、审核 PR、组织最终真机运行和提交'),
    TeamMember(role: '组员 A', name: '陈嘉玲', task: '修改应用标题和项目口号'),
    TeamMember(role: '组员 B', name: '廖春花', task: '修改成员信息和分工'),
    TeamMember(role: '组员 C', name: '岳沛珂', task: '修改真机运行任务列表'),
    TeamMember(role: '组员 D', name: '周伟佳', task: '修改证据说明和README照片说明'),
    TeamMember(role: '组员 E', name: '杨美媛', task: '编写项目 README 文档'),
    TeamMember(role: '组员 F', name: '杨顺粉', task: '完成真机运行测试与截图'),
  ];

  static const List<String> androidTasks = [
      '确定主运行电脑为Windows 系统电脑，主运行手机为Android 手机',
    '从企业微信群下载 platform-tools-latest-windows 工具包并解压配置 ADB 环境',
    '确认项目路径为英文短路径，避免中文、空格或特殊符号导致构建失败',
    '配置清华 Flutter 镜像（FLUTTER_STORAGE_BASE_URL）和 Dart Pub 镜像（PUB_HOSTED_URL）加速依赖下载',
    '运行 flutter doctor -v 检查 Flutter 与 Android 开发环境是否完整就绪',
    '通过 Android Studio SDK Manager 安装 Android SDK Platform、Build-Tools、Platform-Tools 及 Command-line Tools',
    '运行 flutter doctor --android-licenses 连续输入 y 接受所有 Android 许可协议直到结束',
    '在华为手机上进入设置→关于手机→连续点击版本号 7 次，激活开发者选项',
    '返回设置→更多设置→开发者选项→开启 USB 调试开关',
    '用数据线连接手机与电脑，手机端选择"文件传输/MTP"模式，解锁手机并点击允许 USB 调试授权',
    '运行 adb devices 确认设备连接状态显示为 device（非 unauthorized 或 offline）',
    '运行 flutter devices 确认 Flutter 已识别到 Android 设备',
    '进入项目根目录运行 flutter pub get 下载 Dart/Flutter 项目依赖包',
    '运行 flutter test 确认所有单元测试通过',
    '运行 flutter run 将 Flutter 应用编译并安装到华为手机上启动运行',
    '确认手机屏幕正确显示本小组的 Flutter 应用界面及小组信息',
  ];

  static const List<String> evidenceNotes = [
    '不能提交 Web 截图或模拟器截图。',
    '不能使用手机直接截图代替照片。',
    '必须用第二部手机拍摄，并拍到手持真机。',
    '照片需发到小组，并加入 GitHub README。',
    '小组仓库地址：https://github.com/yitingw159/flutter-android-demo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android 真机运行展示')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          AndroidTasksSection(),
          SizedBox(height: 20),
          EvidenceSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.phone_android, size: 42, color: Colors.teal),
            SizedBox(height: 12),
            Text(
              TeamAndroidHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamAndroidHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text(TeamAndroidHomePage.deviceProof, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamAndroidHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class AndroidTasksSection extends StatelessWidget {
  const AndroidTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Android 真机运行任务', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.androidTasks.map((task) => Text('• $task')),
          ],
        ),
      ),
    );
  }
}

class EvidenceSection extends StatelessWidget {
  const EvidenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('真机照片证据要求', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.evidenceNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
