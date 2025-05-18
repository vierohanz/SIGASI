<?php

namespace App\Policies;

use App\Models\User;
use App\Models\rekap_tahunan_gizi;
use Illuminate\Auth\Access\HandlesAuthorization;

class rekap_tahunan_giziPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->can('view_any_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('view_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->can('create_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('update_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('delete_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can bulk delete.
     */
    public function deleteAny(User $user): bool
    {
        return $user->can('delete_any_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can permanently delete.
     */
    public function forceDelete(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('force_delete_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can permanently bulk delete.
     */
    public function forceDeleteAny(User $user): bool
    {
        return $user->can('force_delete_any_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can restore.
     */
    public function restore(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('restore_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can bulk restore.
     */
    public function restoreAny(User $user): bool
    {
        return $user->can('restore_any_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can replicate.
     */
    public function replicate(User $user, rekap_tahunan_gizi $rekapTahunanGizi): bool
    {
        return $user->can('replicate_rekap::tahunan::gizi');
    }

    /**
     * Determine whether the user can reorder.
     */
    public function reorder(User $user): bool
    {
        return $user->can('reorder_rekap::tahunan::gizi');
    }
}
