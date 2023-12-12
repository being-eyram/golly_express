import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/transaction_summary.dart';
import 'package:golly_express/providers/user_info_provider.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userInfoProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: userData.when(
            error: ((error, stackTrace) =>
                const Text('Oops, something unexpected happened')),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (user) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6EDB7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        // const SizedBox(height: 30),
                        const Text(
                          "My Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                userProfile,
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      user.fullName,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      // "+233 $phoneNumber ",
                                      user.phoneNumber,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                              ),
                              onPressed: () {
                                context.push("/editProfile");
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TransactionSummary(),
                  const SizedBox(height: 16),

                  ListTile(
                    minVerticalPadding: 16,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                    leading: gollyExpressLogoMini,
                    title: const Text(
                      "Your Golly Express Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    // onTap: () => context.go("/gollyExpressAddress"),
                    onTap: () => context.push("/gollyExpressAddress"),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Icons.location_on_outlined),
                      title: const Text(
                        "My Address",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                      onTap: () => context.push("/myAddress"),
                    ),
                  ),

                  // id verification list tile
                  Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () => context.push("/verifyID"),
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Icons.badge_outlined),
                      title: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "ID Verification",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      subtitle: const Text(
                        "A valid Ghana card is required to verify your account",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF3AA60),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),

                  // change password list tile
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () => context.push("/changePassword"),
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Icons.lock_outline),
                      title: const Text(
                        "Change Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),

                  // privacy policy list tile
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {},
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Symbols.shield_lock),
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),

                  // terms and conditions
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {},
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Icons.library_books_outlined),
                      title: const Text(
                        "Terms and Condition",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),

                  // logout list tile
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xFFF6F7F6),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () => context.push("/editProfile"),
                      minVerticalPadding: 16,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFA0101),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                      iconColor: const Color(0xFFFA0101),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
