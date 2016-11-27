<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JadwalPengajar extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    const ACTIVE = 1;
    const DEACTIVE = 0;

    protected $table = 'tb_jadwal_pengajar';

    public function mapel()
    {
        return $this->belongsTo('App\Models\Mapel','mapel_id');
    }

    public function cabang()
    {
        return $this->belongsTo('App\Models\Cabang','zona_id');
    }

    public function pengajar()
    {
        return $this->belongsTo('App\Models\Pengajar','pengajar_id');
    }
}
