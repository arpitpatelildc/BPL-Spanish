import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:sif_book/widget/LoadingSplashScreen.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String webUrl;

  const WebViewScreen({super.key, required this.title, required this.webUrl});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // bool isLoading = true;
  // WebViewController webViewController = WebViewController();

  String privacy =
      """<!DOCTYPE html><html><body><main id="main" class="site-main" role="main">
	<article id="post-54" class="post-54 page type-page status-publish hentry">
	<header class="entry-header page-header">
		<h1 class="entry-title">Privacy</h1>
	</header><!-- .entry-header -->
<div class="entry-content">
		<p>Effective June 1, 2015</p>
<p>This Privacy Policy (“Policy”) is designed to assist you in understanding and making informed decisions when using the site about how personal information about you may be obtained, used, shared, and disclosed by Spanish is Fun, LLC (“SIF”). The Policy also describes how you can opt out of some uses of personal information and explains what may be collected on the SIF website (“Website”), how the information is used and under what circumstances it may be disclosed to third parties.&nbsp; Among reasons that SIF collects information is to provide better services to all users of the Website.</p>
<p>The Policy, together with the Terms and Conditions of Use posted on the Website, sets forth the general rules and policies governing your use of the Website.&nbsp; Depending on your activities when visiting the Website, you may be required to agree to additional terms and conditions.</p>
<p>SIF generally agrees to keep the Policy posted on the Website.&nbsp; You should review it frequently, as SIF reserves the right to change it from time to time without prior notice to you.&nbsp; Any changes will be effective immediately upon posting of the revised Policy.&nbsp; Without your consent, SIF will not use your personally identifiable information in a manner materially different than what was stated at the time it was collected unless SIF’s policy changes or is otherwise in that respect.&nbsp; WHEN YOU ACCESS THE WEBSITE, YOU AGREE TO THIS PRIVACY POLICY.&nbsp; IF YOU DO NOT AGREE TO THIS PRIVACY POLICY, OR TO ANY CHANGES THAT MAY BE SUBSEQUENTLY MADE, IMMEDIATELY STOP ACCESSING THE WEBSITE.</p>
<p>&nbsp;</p>
<p>Types of information collected and how used</p>
<p>Personal information is information that may be used to specifically identify or contact you, such as your name, postal address, email address, and telephone number, among other things.&nbsp; When you visit the Website, it does not collect personal information about you unless you voluntarily provided it.&nbsp; This can be done by sending an email to, subscribing for a newsletter, and or requesting information and or material from the Website or service providers who participate in use of the Website, or in other ways.&nbsp; If you provide personal information to us, SIF might receive additional information about you from other sources and combine that additional information with the personal information you provided.&nbsp; If you communicate through this Website, the content of your communications, your e-mail address along with any responses from this Website may be retained.&nbsp; The protections for such electronic communications are the same as used to maintain information received by mail and telephone.&nbsp; The information collected may be used to notify you about changes to the Website, new services and special offers you may find valuable.&nbsp; Lists used to send offers can be developed and managed under the Website’s standards designed to safeguard the security and privacy of personal information. As a user of the Website, you have the opportunity to notify SIF of your desire not to receive such offers by unsubscribing via an e-mail sent for that purpose.&nbsp; In certain circumstances, SIF may request, allow, or otherwise provide you an opportunity to submit your personally identifiable information in connection with a feature, program, promotion or some other aspect of the Website. For instance, you may: (a) provide your name, mail/shipping address, e-mail address, credit card number and phone number when registering with the Website, using services offered through the Website; (b) provide certain demographic information about you (e.g., age, gender, purchase preference, usage frequency, etc.) when participating in a survey, or poll; or (c) post a product and or services rating and recommendation on the Website.&nbsp; Certain information may not be personally identifiable when standing alone (e.g., your age), but may become so when combined with other information (e.g., your age and name).&nbsp; Whether or not you provide this information is your choice; however, in many instances this type of information may be&nbsp; required to participate in a particular activity, realize a benefit that the Website may offer ,or gain access to certain content on the Website.</p>
<p>The personally identifiable information you submit to SIF is generally used to carry out your requests, respond to your inquiries, better serve you, or in other ways naturally associated with the circumstances in which you provided the information.&nbsp; SIF may also use this information to later contact you for a variety of reasons, such as customer service, to provide you with information or services or process transactions that you have requested or agreed to receive, to provide you with marketing or promotional information for products or services, or those of SIF’s parent company, subsidiaries or other affiliated companies (if any), to communicate with you about content or other information you have posted or shared with SIF, or service providers who use the Website, via the Website or with regard to your use of the Website and, in the discretion of SIF, changes to the Website and or Website policies, for internal business purposes, or for purposes disclosed at the time you provide your information, or as otherwise set forth in this Policy.&nbsp; You may opt-out from receiving future promotional information from SIF, or direct that SIF not share your information in the future with any affiliated companies or third parties for their direct marketing purposes.</p>
<p>&nbsp;</p>
<p>In certain instances SIF may also share your personally identifiable information with its third-party vendors who use the Website and or who are performing functions on behalf of SIF, or on behalf of affiliated companies of SIF (e.g., vendors that process credit card orders, deliver merchandise, administer promotions, provide marketing or promotional assistance, analyze data, assist with customer service, and the like).&nbsp; In addition, SIF may share your personally identifiable information with participating sponsors to a program or promotion, and with third parties who assist SIF in using the content or other information that you have posted or shared with SIF via the Website.&nbsp; Further, SIF may share your personally identifiable information with third parties such as promotional partners of SIF and others with whom SIF has marketing or other relationships, among others..</p>
<p>SIF may provide personal information to its affiliates or other trusted businesses or persons to process it for SIF, based on SIF’s instructions and in compliance with the Policy and any appropriate confidentiality and security measures.</p>
<p>Non-personal information is information about you or your activities through which you cannot be personally identified. When you visit the Website, it may collect such information.&nbsp; Examples include the type of browser and operating system you are using, the domain name of your Internet service provider, the pages you visit on the Website and how long you spend on each page, and the unique number assigned to your server or Internet connection.&nbsp; This type of information can include certain personally identifiable information that has been de-identified (i.e., information that has been rendered anonymous).&nbsp; SIF and or its third party service providers may obtain non-personal information about you from information that you provide, either separately or together with your personally identifiable information.&nbsp; SIF and or its third party service providers may also automatically collect certain non-personal information from you when you access the Website. This type information may be used for a variety of purposes, including monitoring use of and improving the Website as well as for internal analysis.&nbsp; The Website may utilize a standard technology called “cookies” to provide the Website’s personalization feature and web server logs to collect information about how the Website is used.&nbsp; Information gathered through cookies and web server logs may include the date and time of visits, the pages viewed, time spent at the Website, and websites visited just before the Website. This information may be collected on an aggregate basis.&nbsp; None of this information may be associated with you as an individual.</p>
<p>&nbsp;</p>
<p>Non-personal information is used in a variety of ways, including to help analyze site traffic, understand customer needs and trends, carry out targeted promotional activities and to improve the services of SIF. SIF may use your non-personal information by itself or aggregate it with information SIF has obtained from others.&nbsp; SIF may share your non-personal information with its affiliated companies and third parties to achieve these objectives and others, but remember that aggregate information is anonymous information that does not personally identify you.&nbsp; SIF may provide an analysis and certain non-personal information to third parties (who may in turn use this information to provide advertisements tailored to your interests), but this will not involve disclosing any of your personally identifiable information.</p>
<p>&nbsp;</p>
<p>Information you provide about a third party.&nbsp; If you send someone else a communication from the Website, such as sending Website content to a business, supplier, service provider, friend, or other person, the information you provide (names, e-mail addresses, etc.) ma be used to facilitate the communication and may not be used for any other marketing purpose unless SIF obtains consent from that person or SIF explicitly say otherwise.&nbsp; Please be aware that when you use any send-to- functionality on the Website, your e-mail address may be included in the communication sent.</p>
<p>&nbsp;</p>
<p>Information third parties provide about you.&nbsp; SIF also may, from time to time, supplement the information it collects with outside records from third parties in order to enhance its ability to serve you, to tailor its content to you and to offer you opportunities to purchase products or services that it believes may be of interest to you.&nbsp; SIF may combine the information it receives from those other sources with information it collects through the Website.&nbsp; In those cases, SIF will apply this Policy to any personal identifiable information received, unless otherwise specifically disclosed by SIF at the time you provide your personally identifiable information.<br>
Personal and or other information.&nbsp; In addition to any personally identifiable information or other information that you choose to provide to SIF on the Website, SIF and its third-party service providers may use a variety of technologies, now and hereafter devised, that automatically collect certain website usage information whenever you visit or interact with the Website.&nbsp; This information may include browser type, operating system, the page served, the time, the source of the request, the preceding page view, and other similar information.&nbsp; SIF may use this usage information for a variety of purposes, including and such as to enhance or otherwise improve the Website.&nbsp; In addition, SIF may also collect your IP address or some other unique identifier for the particular device you use to access the Internet, as applicable (collectively, referred to herein as a “Device Identifier”).&nbsp; A Device Identifier is a number that is automatically assigned to your computer, and SIF may identify your device by its Device Identifier.&nbsp; When analyzed, usage information helps SIF determine how the Website is used, such as what types of visitors arrive at the Website, what type of content is most popular, what type of content you may find most relevant, and what type of visitors are interested in particular kinds of content and advertising.&nbsp; SIF may associate your Device Identifier or website usage information with the personally identifiable information you provide and may treat the combined information as personally identifiable information.&nbsp; Website usage information may be collected using various methods, such as web beacons, cookies, mobile device identifiers, and embedded scripts, among other methods.<br>
Information collected through passive means may be non-identifying or may be associated with you.&nbsp; In the latter case it will be treated as personally identifiable information.</p>
<p>Information shared.&nbsp; SIF will share personal information with companies, organizations or individuals outside SIF if it has a good-faith belief that access, use, preservation or disclosure of the information is reasonably necessary to: meet any applicable law, regulation, legal process or enforceable governmental request; enforce applicable Terms and Conditions of Service, including investigation of potential violations; detect, prevent, or otherwise address fraud, security or technical issues; and, to protect against harm to the rights, property or safety of SIF, Website users, or the public as required or permitted by law.</p>
<p>The Website does not have a policy of selling or renting your personal information to third parties.&nbsp; It may be shared with unrelated third parties, including contractors that provide services to the Website. For example, the information may be provided to third parties that assist with the operation or maintenance of this site or that may be retained to deliver newsletters, information, or other items to you. When personal information is provided to third parties, they may be required to exercise reasonable care to protect your personal information, and restrict the use to the purposes for which it was provided to them. Also, non-personal information may be used for a variety of purposes, including statistical or demographic analysis and improvements in the design and content of this site.</p>
<p>Other uses.&nbsp; If you send SIF an e-mail with questions or comments, SIF may use your personally identifiable information to respond to your questions or comments, and SIF may save your questions or comments for future reference.&nbsp; For security reasons, SIF does not recommend that you send non-public personally identifiable information, such as passwords, social security numbers or bank account information, to it by e-mail.&nbsp; Further, SIF may communicate with you by e-mail under the following circumstances: (a) if you request a particular service or sign up for a feature that involves e-mail communications; (b) if it relates to requests you have made to and or purchases you have made from or through SIF (e.g., product/services updates, customer support, etc.); (c) if SIF is sending you information about products and services; (d) if you consented to being contacted by e-mail for a particular purpose; (e) if you send SIF an e-mail, post information on the Website or otherwise submit information to SIF electronically, SIF may e-mail you to follow-up or otherwise communicate with you with respect thereto; (f) to provide you legal notices or notices with respect to your use of the Website; or (g) to otherwise facilitate a transaction between you and SIF and or someone else.&nbsp; In certain instances, SIF may provide you with tools on the Website that will allow you to set your preferences for receiving e-mail communications from SIF and or other persons; that is, to agree to some communications but not others.&nbsp; You may “opt out” of receiving future commercial e-mail communications from SIF by clicking the “unsubscribe” link or following the other instructions included at the bottom of most e-mails that SIF sends; provided, however, SIF reserves the right to send you transactional e-mails such as customer service communications.<br>
Your California Privacy Rights: Residents of the State of California, under certain provisions of the California Civil Code, have the right to request from companies conducting business in California a list of all third parties to which the company has disclosed certain personally identifiable information as defined under California law during the preceding year for third party direct marketing purposes.&nbsp; You are limited to one request per calendar year.&nbsp; In your request, please attest to the fact that you are a California resident and provide a current California address for our response.&nbsp; You may request the information in writing at:</p>
<p>&nbsp;</p>
<p>Children under the age of 13.&nbsp; The features, programs, promotions and other aspects of the Website requiring personally identifiable information are not intended for children.&nbsp; SIF does not knowingly collect personally identifiable information from children under the age of thirteen (13).&nbsp; If you are a parent or guardian of a child under the age of thirteen (13) and believe he or she has disclosed personally identifiable information to SIF, please contact SIF at Silvia Cubillos Velez: HYPERLINK “mailto:director@siflanguageschool.com” director@siflanguageschool.com or&nbsp; HYPERLINK “mailto:Learning@SIFlanguageschool.com” Learning@SIFlanguageschool.com Phone 303 2000622.&nbsp; A parent or guardian of a child under the age of thirteen (13) may review and request deletion of such child’s personally identifiable information as well as prohibit the use thereof.</p>
<p>Exceptions to the Policy.&nbsp; The Policy applies to all of the services SIF offers.&nbsp; It excludes services that have separate privacy policies that do not incorporate this Policy.&nbsp; Furthermore, it does not apply to services offered by other companies or individuals, including products, services, or sites that may be displayed to you on the Website, or other sites linked from the Website. The Policy does not cover the information practices of other companies and organizations who advertise on and or provide services through the Website, and who may use cookies, pixel tags and other technologies to serve and offer relevant ads.</p>
<p>Regarding the Website’s links to other websites, note that SIF, the Website and or its operator are not responsible for the information collection or privacy practices of such websites.&nbsp; You should consult privacy policies of other websites before you visit those sites or provide any personal information to those sites.&nbsp; SIF, the Website and or its operator may provide information at the Website about programs and events that are sponsored by or co-sponsored by other firms or organizations.&nbsp; If you register for any of these events, SIF, the Website and or its operator may have no control over the third-party sponsor’s use of your personal information.</p>
<p>Third party applications may be available via the Website.&nbsp; The owners of these applications (“Third Party Owners”) may collect personally identifiable information from you and may have their own policies and practices.&nbsp; SIF is not responsible for how Third Party Owners or their applications use your personally identifiable information.&nbsp; These Third Party Owners may have their own terms of service, privacy policies or other policies and ask you to agree to the same.&nbsp; SIF is not responsible for these policies or the practices of Third Party Owners.&nbsp; Be sure to review any available policies before submitting any personally identifiable information to a third party application or otherwise interacting with it.</p>
<p>SIF, the Website and or the operator thereof reserves the right to disclose your personal information if it is believed that the Website is being used to commit unlawful acts; if disclosure of your personal information is required to comply with applicable laws or regulations or with a court or administrative order, or will help to enforce any applicable terms of use; to protect your safety or security, including the safety and security of property that belongs to you; or to protect the safety and security of our site or third parties; and or information when legally compelled to do disclose, such as when it is believed, in good faith, believe that the law requires it or for the protection of the sites and or operator’s legal rights.</p>
<p>Security</p>
<p>Although it is believed that security measures are employed that reasonably appropriate to protect your personal information, neither SIF, the Website nor its operator guarantees that such security precautions will protect against the loss or misuse of your personal information.&nbsp; Similarly, neither SIF, the Website, nor its operator can guarantee the privacy of personal information you transmit over the Internet or that may be collected in transit by others, including contractors that provide services to SIF, the Website and or to its operator.</p>
<p>By using the Website you understand and consent to the transfer of your personal information across national borders and to the storage and processing of your information in a country that may not provide the same level of privacy protection that your country provides.</p>
<p>Revisions<br>
SIF, the Website and its operator reserve the right to revise this Policy at any time without notice. Please review this Policy periodically for changes.<br>
Questions<br>
If you have any questions regarding this Policy, or if you wish to opt out of the use of your personal data by this site and or it operator, you may send an email to Silvia Cubillos Velez or write to &nbsp;<a href="mailto:learning@siflanguageschool.com">learning@siflanguageschool.com</a>, <a href="mailto:director@siflanguageschool.com ">director@siflanguageschool.com </a> or call 303-200 0622</p>
<div id="blueimp-gallery" class="blueimp-gallery" data-usebootstrapmodal="0" data-fullscreen="0">
            <div class="slides"></div>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
        <div class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" aria-hidden="true">×</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body next"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left prev">
                            Previous
                        </button>
                        <button type="button" class="btn btn-primary next">
                            Next
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>			</div><!-- .entry-content -->
	</article><!-- #post-## --></main>
</body>
</html>""";

  String aboutUs = """<!DOCTYPE html>
<html>

<body>
<main id="main" class="site-main" role="main">
								
				<img width="750" height="250" src="https://siflanguageschool.com/wp-content/uploads/2015/02/about-us-750x250.jpg" class="attachment-unite-featured size-unite-featured wp-post-image" alt="" loading="lazy" srcset="https://siflanguageschool.com/wp-content/uploads/2015/02/about-us.jpg 750w, https://siflanguageschool.com/wp-content/uploads/2015/02/about-us-300x100.jpg 300w" sizes="(max-width: 750px) 100vw, 750px">	
					
<article id="post-2" class="post-2 page type-page status-publish has-post-thumbnail hentry">
	<header class="entry-header page-header">
		<h1 class="entry-title">About SIF</h1>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<h4>WELCOME TO SIF LANGUAGE SCHOOL!</h4>
<div class="col-md-offset-2 col-md-8">
<iframe loading="lazy" width="560" height="315" src="https://www.youtube.com/embed/qigVthaX9WE?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen=""></iframe>
</div>
<div class="clearfix"></div>
<h5 class="bold text-center offset-top-1">“Exercise your brain! Learn Spanish!”</h5>
<p>
We are a dynamic language school, always keeping up to date with the science of learning. All of our classes are taught using our <strong>Brain Path Language® system.  BPL®</strong> integrates all the different learning areas of your brain, making language acquisition faster and more natural.  In addition to classroom learning, adults and children can join SIF in immersions, workshops, summer camps, and study abroad.  These activities offer you an opportunity to speak Spanish with others.</p>
<div class="clearfix"></div>
					
			</main>
</body>

</html>
""";
  String termsOfService = """<!DOCTYPE html>
<html>

<body>
<main id="main" class="site-main" role="main">
								
				<img width="750" height="250" src="https://siflanguageschool.com/wp-content/uploads/2015/02/about-us-750x250.jpg" class="attachment-unite-featured size-unite-featured wp-post-image" alt="" loading="lazy" srcset="https://siflanguageschool.com/wp-content/uploads/2015/02/about-us.jpg 750w, https://siflanguageschool.com/wp-content/uploads/2015/02/about-us-300x100.jpg 300w" sizes="(max-width: 750px) 100vw, 750px">	
					
<article id="post-2" class="post-2 page type-page status-publish has-post-thumbnail hentry">
	<header class="entry-header page-header">
		<h1 class="entry-title">About SIF</h1>
	</header><!-- .entry-header --><div class="entry-content">
		<div class="groupnew">
<h3 class="titleList blueColor">TERMS AND CONDITIONS</h3>
<div class="contentList">
<div class="simple_accordion">
<div class="acc_item">
<h2 class="acc_header active" style="color: rgb(14, 76, 144); font-size: 18px;">1. Introduction.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content" style="max-height: 204px;">
<div>
<ul class="acc_list">
<li>These terms and conditions (Terms) apply when you use this website, <a href="www.siflanguageschoul.com">www.siflanguageschoul.com</a></li>
<li>You agree to be bound by these Terms which form a binding contractual agreement between you and us, SPANISH IS FUN LLC EIN 20 029 86 91 (<strong>SPANISH IS FUN LLC, our, we</strong> or <strong>us</strong>).</li>
<li>If you don’t agree to these Terms, you must refrain from using the Website.</li>
<li>We may change these Terms at any time by updating this page of the Website, and your continued use of the Website fullowing such an update will represent an agreement by you to be bound by the Terms as amended.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">2. Access and use of the website.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>You must only use the Website in accordance with these Terms and any applicable laws, and must ensure that your employees, sub-contractors and any other agents who use or access the Website comply with the Terms and any applicable laws.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">3. Your obligations.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>You must not:
<ul>
<li>Copy, mirror, reproduce, translate, adapt, vary, modify, sell, decipher or decompile any part or aspect of the Website without the express consent of the Company.</li>
<li>Use the Website for any purpose other than the purposes of browsing, selecting or purchasing goods.</li>
<li>Use, or attempt to use, the Website in a manner that is illegal or fraudulent or facilitates illegal or fraudulent activity.</li>
<li>Use, or attempt to use, the Website in a manner that may interfere with, disrupt or create undue burden on the Website or the servers or networks that host the Website.</li>
<li>Use the Website with the assistance of any automated scripting toul or software.</li>
<li>Act in a way that may diminish or adversely impact the reputation of the Company, including by linking to the Website on any other website; and</li>
<li>Attempt to breach the security of the Website, or otherwise interfere with the normal functions of the Website, including by:
<ul>
<li>Gaining unauthorised access to Website accounts or data.</li>
<li>Scanning, probing or testing the Website for security vulnerabilities.</li>
<li>Overloading, flooding, mailbombing, crashing or submitting a virus to the Website. or</li>
<li>Instigate or participate in a denial-of-service attack against the Website.</li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">4. Information on the website.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>While we make every effort to ensure that the information on the Website is as up-to-date and accurate as possible, you acknowledge and agree that we do not (to the maximum extent permitted by law) guarantee that:
<ul>
<li>the Website will be free from errors or defects.</li>
<li>the Website will be accessible at all times.</li>
<li>messages sent through the Website will be delivered promptly, or delivered at all.</li>
<li>information you receive or supply through the Website will be secure or confidential. or</li>
<li>any information provided through the Website is accurate or true.</li>
</ul>
</li>
<li>We reserve the right to change any information or functionality on the Website by updating the Website at any time without notice, including product descriptions, prices and other Website Content.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">5. Intellectual property.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>The Company retains ownership of the Website and all materials on the Website (including text, graphics, logos, design, icons, images, sound and video recordings, pricing, downloads and software) (Website Content) and reserves all rights in any intellectual property rights owned or licensed by it not expressly granted to you.</li>
<li>You may make a temporary electronic copy of all or part of the Website for the sole purpose of viewing it. You must not otherwise reproduce, transmit, adapt, distribute, sell, modify or publish the Website or any Website Content without prior written consent from the Company or as permitted by law.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">6. Links to other websites.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>The Website may contain links to other websites that are not our responsibility. We have no control over the content of the linked websites and we are not responsible for it.</li>
<li>Inclusion of any linked website on the Website does not imply our approval or endorsement of the linked website.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">7. Security.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>The Company does not accept responsibility for loss or damage to computer systems, mobile phones or other electronic devices arising in connection with use of the Website. You should take your own precautions to ensure that the process that you employ for accessing the Website does not expose you to risk of viruses, malicious computer code or other forms of interference.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">8. Reporting misuse.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>If you become aware of misuse of the Website by any person, any errors in the material on the Website or any difficulty in accessing or using the Website, please contact us immediately using the contact details or form provided on our Website.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">9. Privacy.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>You agree to be bound by our Privacy Policy, which can be found <a href="https://p30.6c8.myftpupload.com/privacy-policy"><here></here></a>.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">10. Liability.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>We make no warranties or representations about this Website or any of its content and will not be responsible to you or any third party for any direct or consequential loss suffered in connection with the use of this Website. To the maximum extent permitted by law, we exclude any liability that may arise due to your use of our Website and/or the information or materials contained on it. You agree to indemnify us for any loss or liability arising out of your use of this Website.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">11. General.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>WAIVER
<ul>
<li>No party to this agreement may rely on the words or conduct of any other party as a waiver of any right unless the waiver is in writing and signed by the party granting the waiver.</li>
</ul>
</li>
<li>SEVERANCE
<ul>
<li>Any term of this agreement which is wholly or partially void or unenforceable is severed to the extent that it is void or unenforceable. The validity and enforceability of the remainder of this agreement is not limited or otherwise affected.</li>
</ul>
</li>
<li>JOINT AND SEVERAL LIABILITY
<ul>
<li>An obligation or a liability assumed by, or a right conferred on, two or more persons binds or benefits them jointly and severally.</li>
</ul>
</li>
<li>ASSIGNMENT
<ul>
<li>A party cannot assign, novate or otherwise transfer any of its rights or obligations under this agreement without the prior written consent of the other party.</li>
</ul>
</li>
<li>ENTIRE AGREEMENT
<ul>
<li>This agreement embodies the entire agreement between the parties and supersedes any prior negotiation, conduct, arrangement, understanding or agreement, express or implied, in relation to the subject matter of this agreement.</li>
</ul>
</li>
<li>INTERPRETATION
<ul>
<li>(<strong>singular and plural)</strong> words in the singular includes the plural (and vice versa).</li>
<li><strong>(gender)</strong> words indicating a gender includes the corresponding words of any other gender.</li>
<li><strong>(defined terms)</strong> if a word or phrase is given a defined meaning, any other part of speech or grammatical form of that word or phrase has a corresponding meaning.</li>
<li><strong>(person)</strong> a reference to “person” or “you” includes an individual, the estate of an individual, a corporation, an authority, an association, consortium or joint venture (whether incorporated or unincorporated), a partnership, a trust and any other entity.</li>
<li><strong>(party)</strong> a reference to a party includes that party’s executors, administrators, successors and permitted assigns, including persons taking by way of novation and, in the case of a trustee, includes any substituted or additional trustee.</li>
<li><strong>(this agreement)</strong> a reference to a party, clause, paragraph, schedule, exhibit, attachment or annexure is a reference to a party, clause, paragraph, schedule, exhibit, attachment or annexure to or of this agreement, and a reference to this agreement includes all schedules, exhibits, attachments and annexures to it.</li>
<li><strong>(document)</strong> a reference to a document (including this agreement) is to that document as varied, novated, ratified or replaced from time to time;</li>
<li><strong>(headings)</strong> headings and words in bold type are for convenience only and do not affect interpretation.</li>
<li><strong>(includes)</strong> the word “includes” and similar words in any form is not a word of limitation.</li>
<li><strong>(adverse interpretation)</strong> no provision of this agreement will be interpreted adversely to a party because that party was responsible for the preparation of this agreement or that provision. and</li>
<li><strong>(currency)</strong> a reference to “dollar”, is to United States currency, unless otherwise agreed in writing.</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>
<p> <!-- end accordion -->
</p></div>
<h3 class="titleList blueColor">PRIVACY POLICY</h3>
<div class="contentList">
<div class="simple_accordion">
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">1. Introduction.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>This document sets out the privacy policy of SPANISH IS FUN LLC EIN 20 029 86 91 (referred to in this privacy policy as <strong>‘we’, ‘us’</strong>, or <strong>‘our’</strong>).</li>
<li>We take our privacy obligations seriously and we’ve created this privacy policy to explain how we store, maintain, use and disclose personal information.</li>
<li>By providing personal information to us, you consent to our storage, maintenance, use and disclosing of personal information in accordance with this privacy policy.</li>
<li>We may change this privacy policy from time to time by posting an updated copy on our website and we encourage you to check our website regularly to ensure that you are aware of our most current privacy policy.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">2. Types of personal information we collect.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>The personal information we collect may include the following:
<ul>
<li>Name.</li>
<li>Mailing or street address.</li>
<li>Email address.</li>
<li>Social media information.</li>
<li>Telephone number and other contact details.</li>
<li>Age.</li>
<li>Date of birth.</li>
<li>Credit card or other payment information.</li>
<li>Information about your business or personal circumstances.</li>
<li>Information in connection with client surveys, questionnaires and promotions.</li>
<li>Your device identity and type, I.P. address, geo-location information, page view statistics, advertising data and standard web log information. </li>
<li>Information about third parties. and</li>
<li>Any other information provided by you to us via our website or our online presence, or otherwise required by us or provided by you.</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">3. How we collect personal information.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>1.	We may collect personal information either directly from you, or from third parties, including where you:
<ul>
<li>Contact us through our website.</li>
<li>Receive goods or services from us.</li>
<li>Submit any of our online sign up forms.</li>
<li>Communicate with us via email, telephone, SMS, social applications (such as LinkedIn, Facebook or Instagram) or otherwise.</li>
<li>Interact with our website, social applications, services, content and advertising. and.</li>
<li>Invest in our business or enquire as to a potential purchase in our business.</li>
</ul>
</li>
<li>We may also collect personal information from you when you use or access our website or our social media pages. This may be done through use of web analytics tools, ‘cookies’ or other similar tracking technologies that allow us to track and analyse your website usage. Cookies are small files that store information on your computer, mobile phone or other device and enable and allow the creator of the cookie to identify when you visit different websites. If you do not wish information to be stored as a cookie, you can disable cookies in your web browser.</li>
<li>We may use Google Analytics to collect and process data, including when you use third party websites or apps. To find out more see <a href="http://www.google.com/policies/privacy/partners/">How Google uses data when you use our partners’ sites or apps.</a></li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">4. Use of your personal information.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>We collect and use personal information for the following purposes:
<ul>
<li>To provide goods, services or information to you.</li>
<li>For record keeping and administrative purposes.</li>
<li>To provide information about you to our contractors, employees, consultants, agents or other third parties for the purpose of providing goods or services to you.</li>
<li>To improve and optimise our service offering and customer experience.</li>
<li>To comply with our legal obligations, resolve disputes or enforce our agreements with third parties.</li>
<li>To send you marketing and promotional messages and other information that may be of interest to you and for the purpose of direct marketing (in accordance with the Spam Act). In this regard, we may use email, SMS, social media or mail to send you direct marketing communications. You can opt out of receiving marketing materials from us by using the opt-out facility provided (e.g. an unsubscribe link).</li>
<li>To send you administrative messages, reminders, notices, updates, security alerts, and other information requested by you; an.</li>
<li>To consider an application of employment from you.</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">5. Sensitive information.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>We may collect sensitive information about you during the course of providing you services. The type of sensitive information we may collect includes health information you input into our mobile application relating to an ailment you suffer from. </li>
<li>We will only collect this sensitive information where you consent and provide us with this information. If you consent, your sensitive information may only be used and disclosed for purposes relating to providing you with our services or referring you to a medical or health service provider. </li>
<li>Your sensitive information may also be used or disclosed to comply with our legal obligations.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">6. Security.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>We take reasonable steps to ensure your personal information is secure and protected from misuse or unauthorised access. Our information technology systems are password protected, and we use a range of administrative and technical measures to protect these systems. However, we cannot guarantee the security of your personal information.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">7. Links.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>Our website may contain links to other websites. Those links are provided for convenience and may not remain current or be maintained. We are not responsible for the privacy practices of those linked websites and we suggest you review the privacy policies of those websites before using them.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">8. Requesting access or correcting your personal information.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>If you wish to request access to the personal information we hold about you, please contact us using the contact details set out below including your name and contact details. We may need to verify your identity before providing you with your personal information. In some cases, we may be unable to provide you with access to all your personal information and where this occurs, we will explain why. We will deal with all requests for access to personal information within a reasonable timeframe.</li>
<li>If you think that any personal information we hold about you is inaccurate, please contact us using the contact details set out below and we will take reasonable steps to ensure that it is corrected.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">9. Complaints.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>If you wish to complain about how we handle your personal information held by us, please contact us using the details set out below including your name and contact details. We will investigate your complaint promptly and respond to you within a reasonable timeframe.</li>
</ul>
</div>
</div>
</div>
<div class="acc_item">
<h2 class="acc_header" style="color: rgb(14, 76, 144); font-size: 18px;">10. contact us.<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" width="23px" height="23px" fill="#0e4c90"><path d="M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z"></path></svg></h2>
<div class="acc_content">
<div>
<ul class="acc_list">
<li>For further information about our privacy policy or practices, or to access or correct your personal information, or make a complaint, please contact us using the details set out below:</li>
<li><strong>Name:</strong> Silvia Cubillos Velez</li>
<li><strong>Email:</strong> learning@siflanguageschool.com</li>
<li>Our privacy policy was last updated on 13 November 2023.</li>
</ul>
</div>
</div>
</div>
</div>
<p> <!-- end accordion -->
</p></div>
</div>
<p><script>
simple_accordion({
headerSize: 18,
headerColor: "#0e4c90",
headerActiveColor: "#f36f21",
firstActive: true,
});
</script></p>
</main>
</body>

</html>""";

  @override
  void initState() {
    super.initState();
    // webViewController..setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {},
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {
    //       setState(() {
    //         isLoading = false;
    //       });
    //     },
    //     onWebResourceError: (WebResourceError error) {},
    //   ),
    // )
    //   ..loadRequest(Uri.parse(widget.webUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sifBlue,
        toolbarHeight: headerHeight,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: headerFontSize,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Html(
                data: widget.title == "About Us"
                    ? aboutUs
                    : widget.title == "Terms of Services"
                        ? termsOfService
                        : privacy))
        // Stack(
        //   children: [
        //     WebViewWidget(
        //       controller: webViewController,
        //     ),
        //     if (isLoading) LoadingSplashScreen(color: Colors.white,),
        //   ],
        // ),
        );
  }
}
