import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to ASKTU. ASKTU ("we", "our", "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the "App"). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the App.',
            ),
            SizedBox(height: 16),
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1.1 Personal Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '- Contact Information: Such as your email address or phone number if you provide it to us for account creation or customer support.',
            ),
            Text(
              '- Health Information: Data related to your physical activities, such as the number of steps taken, distance traveled, and other related metrics.',
            ),
            SizedBox(height: 8),
            Text(
              '1.2 Non-Personal Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '- Usage Data: Information about how you use the App, including your app usage patterns, the pages you visit, and other interaction data.',
            ),
            SizedBox(height: 16),
            Text(
              '2. How We Use Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use the collected information for various purposes:',
            ),
            Text(
              '- To Provide and Maintain the App: To monitor the usage of our App and to ensure its functionality.',
            ),
            Text(
              '- To Improve Our App: To understand how our users interact with the App and make improvements.',
            ),
            Text(
              '- To Communicate with You: To send you updates, notifications, and other information related to the App.',
            ),
            Text(
              '- To Personalize Your Experience: To provide you with content and features that are tailored to your interests.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Sharing Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We do not sell, trade, or otherwise transfer your Personally Identifiable Information to outside parties except as described in this Privacy Policy. We may share your information in the following situations:',
            ),
            Text(
              '- With Service Providers: We may share your information with third-party service providers who perform services on our behalf, such as data analysis and customer support.',
            ),
            Text(
              '- For Legal Reasons: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or a government agency).',
            ),
            SizedBox(height: 16),
            Text(
              '4. Data Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We implement appropriate technical and organizational measures to protect your personal data against unauthorized access, alteration, disclosure, or destruction. However, no internet or email transmission is ever fully secure or error-free. Therefore, while we strive to protect your personal data, we cannot guarantee its absolute security.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Your Data Protection Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Depending on your location, you may have the following rights regarding your personal data:',
            ),
            Text(
              '- The Right to Access: You have the right to request copies of your personal data.',
            ),
            Text(
              '- The Right to Rectification: You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.',
            ),
            Text(
              '- The Right to Erasure: You have the right to request that we erase your personal data, under certain conditions.',
            ),
            Text(
              '- The Right to Restrict Processing: You have the right to request that we restrict the processing of your personal data, under certain conditions.',
            ),
            Text(
              '- The Right to Data Portability: You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
                'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: batubattal@gmail.com'),
            SizedBox(height: 8),
            Text(
              '8. Consent',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'By using our App, you hereby consent to our Privacy Policy and agree to its terms.',
            ),
          ],
        ),
      ),
    );
  }
}
