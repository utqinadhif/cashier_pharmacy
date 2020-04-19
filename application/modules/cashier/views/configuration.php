<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="box">
  <div class="box-header with-border">
    <h3 class="box-title">Konfigurasi</h3>
  </div>
  <div class="box-body">
    <form action="<?php echo base_url('cashier/configuration/action') ?>" method="POST">
      <?php echo @alert($this->session->flashdata('configuration'), 'info');?>
      <div class="form-group">
        <label>Nama Toko</label>
        <input name="store" class="form-control" value="<?php echo @$store;?>" type="text" placeholder="Masukkan nama toko" required>
      </div>
      <div class="form-group">
        <label>Alamat Toko</label>
        <textarea name="address" class="form-control" placeholder="Masukkan alamat"><?php echo @$address;?></textarea>
      </div>
      <div class="form-group">
        <label>Telepon</label>
        <input name="phone" class="form-control" value="<?php echo @$phone;?>" type="text" placeholder="Masukkan nomor">
      </div>
      <div class="form-group">
        <label>Alamat Printer</label>
        <input name="printer" class="form-control" value="<?php echo @$printer;?>" type="text" placeholder="Masukkan alamat/ nama printer">
        <i>
          <small>
            <ol>
              <li>Sebaiknya semua konfigurasi diisi dengan data yang benar.</li>
              <li>Data akan digunakan pada nota.</li>
            </ol>
          </small>
        </i>
      </div>
      <div class="form-group">
        <label>Pilih Tema</label>
        <select class="form-control" name="theme">
          <?php
          $array = array('skin-blue','skin-blue-light','skin-black','skin-black-light','skin-green','skin-green-light','skin-red','skin-red-light','skin-yellow','skin-yellow-light','skin-purple','skin-purple-light');
          foreach ($array as $val) {
            ?>
            <option value="<?php echo $val;?>"<?php echo $val == @$theme ? ' selected="selected"' : '';?>><?php echo $val;?></option>
            <?php
          }
          ?>
        </select>
      </div>
      <div class="form-group">
        <button class="btn btn-success btn-flat" type="submit">Simpan</button>
        <button class="btn btn-warning btn-flat" type="reset">Reset</button>
      </div>
    </form>
  </div>
</div>