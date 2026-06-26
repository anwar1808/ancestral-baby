/// Abstraction over cloud sync / sharing (§2, §3).
///
/// The app is local-first and fully functional offline with no account. Sign-in
/// is only needed to back up or share with a partner, and is passwordless. The
/// concrete Supabase implementation (Postgres + Auth + RLS + Realtime) plugs in
/// behind this interface; [LocalOnlySync] is the default no-account path.
abstract class SyncRepository {
  bool get isSignedIn;
  String? get userEmail;
  String? get householdId;

  /// Passwordless sign-in (magic link / Google / Apple). Returns when complete.
  Future<void> signInWithMagicLink(String email);
  Future<void> signInWithGoogle();
  Future<void> signOut();

  /// Owner creates an invite (share link or 6-digit code) for a partner.
  Future<String> createInviteCode();

  /// Partner joins an existing household with a code.
  Future<void> joinHousehold(String code);

  /// Push local changes up and pull remote changes down. No-op when offline.
  Future<void> sync();
}

/// Default implementation: everything stays on-device. Sharing/backup prompt
/// surfaces only when the user explicitly asks (§3). This keeps core features
/// usable with zero auth and makes the Supabase swap a drop-in later.
class LocalOnlySync implements SyncRepository {
  @override
  bool get isSignedIn => false;

  @override
  String? get userEmail => null;

  @override
  String? get householdId => 'local';

  @override
  Future<void> signInWithMagicLink(String email) async =>
      throw const SyncUnavailable();

  @override
  Future<void> signInWithGoogle() async => throw const SyncUnavailable();

  @override
  Future<void> signOut() async {}

  @override
  Future<String> createInviteCode() async => throw const SyncUnavailable();

  @override
  Future<void> joinHousehold(String code) async => throw const SyncUnavailable();

  @override
  Future<void> sync() async {/* offline: nothing to do */}
}

/// Thrown when a sync/share action is attempted without a configured backend.
class SyncUnavailable implements Exception {
  const SyncUnavailable();
  @override
  String toString() =>
      'Cloud sharing isn\'t set up in this build yet. Ancestral Baby works fully '
      'offline; partner sharing arrives with passwordless sign-in.';
}
