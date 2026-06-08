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
    TeamMember(role: '组长', name: '李组长', task: '创建仓库、维护 main、审核 PR、组织主电脑和主手机完成真机运行'),
    TeamMember(role: '组员 A', name: '成员 A', task: '修改应用标题 projectTitle 和项目口号 projectSlogan'),
    TeamMember(role: '组员 B', name: '成员 B', task: '补充 members 中的小组成员姓名与分工'),
    TeamMember(role: '组员 C', name: '成员 C', task: '补充 androidTasks 中的真机运行检查任务'),
    TeamMember(role: '组员 D', name: '成员 D', task: '补充 evidenceNotes 中的拍照和 README 证据说明'),
  ];

  static const List<String> androidTasks = [
    '选择杨顺粉的电脑作为主运行电脑，Android手机作为真机运行设备',
    '从企业微信群下载 platform-tools 工具包并解压配置 ADB',
    '在Android手机上打开开发者选项并开启 USB 调试',
    '使用 adb devices 确认设备连接状态为 device',
    '执行 flutter doctor 和 flutter devices 检查开发环境',
    '使用 flutter run 在真实手机上成功运行 Flutter 应用',

  ];

  static const List<String> evidenceNotes = [
    '不能提交 Web 截图或模拟器截图。',
    '不能使用手机直接截图代替照片。',
    '必须用第二部手机拍摄，并拍到手持真机。',
    '照片需发到小组，并加入 GitHub README。',
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
