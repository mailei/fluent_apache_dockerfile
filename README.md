# fluentd-uiとapache2がインストールされているubuntu18.04のイメージ
* fluentd-uiの動作確認用イメージ

* 詳しくは、以下のURL参照  
  https://qiita.com/mailei/items/581e3d4a6016333d8b12

fluentdのconfig設定

```
送信側
<match apache.**>
  @type stdout
</match>

<match apache.**>
  @type forward
  <server>
    host 172.17.0.3
    port 24224
  </server>
</match>

<source>
  @type tail
  path /var/log/apache2/access.log
  pos_file /var/log/fluentd/httpd-access.log.pos
  tag apache.access
  format apache2
</source>

<match apache.**>
  type file
  path /var/log/fluentd/out
</match>



受信側
<source>
  @type forward
</source>

<match apache.**>
  @type stdout
</match>

<match apache.**>
  type file
  path /tmp/acce.log
</match>

<match apache.**>
  @type stdout
</match>


```
