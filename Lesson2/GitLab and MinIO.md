# Steps to reproduce

1. [Setup GitLab on VirtualBox. Step 1-6](https://embeddedinventor.com/complete-guide-to-setting-up-gitlab-locally-on-mac/#Things_you_will_need)
   1. Virtual machine IP was: `192.168.0.186` and GitLab available by [http://192.168.0.186/](http://192.168.0.186/)
2. Second step it is [MinIO](https://min.io/)
   1. `wget https://dl.min.io/server/minio/release/linux-amd64/minio`
   2. `chmod +x minio`
   3. `MINIO_ROOT_USER=minioadmin MINIO_ROOT_PASSWORD=minioadmin ./minio server --console-address=192.168.0.186:8085 ~/data`
3. Config for `/etc/gitlab/gitlab.rb`
```
### Git LFS
 gitlab_rails['lfs_enabled'] = true
 gitlab_rails['lfs_object_store_enabled'] = true
 gitlab_rails['lfs_object_store_direct_upload'] = true
 gitlab_rails['lfs_object_store_background_upload'] = false
 gitlab_rails['lfs_object_store_remote_directory'] = "test"
 gitlab_rails['lfs_object_store_connection'] = {
   'provider' => 'AWS',
   'region' => 'eu-west-1',
   'aws_access_key_id' => 'minioadmin',
   'aws_secret_access_key' => 'minioadmin',
   'endpoint' => 'http://192.168.0.186:9000',
   'host' => '192.168.0.186',
   'path_style' => true
 }
```
And reconfigure gitlab `sudo gitlab-ctl reconfigure`
4. After creating and pulling GitLab repo you should initialize `lfs` by this tutorial [https://git-lfs.github.com/](https://git-lfs.github.com/)