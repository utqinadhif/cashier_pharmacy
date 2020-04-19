<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="login-box">
  <div class="login-logo">
    <b>Kasir</b> <?php echo $store;?>
  </div>
  <div class="login-box-body">
    <p class="login-box-msg">Masuk untuk mulai menggunakan aplikasi</p>
    <?php echo alert($msg, 'danger');?>
    <form action="<?php echo $action;?>" method="POST">
      <div class="form-group has-feedback">
        <input name="username" type="text" class="form-control" placeholder="Masukkan username" required="1">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" type="password" class="form-control" placeholder="Masukkan password" required="1">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
    </form>
    <br>
    <p class="pull-right">Ver. Beta</p>
    <br>
  </div>
</div>