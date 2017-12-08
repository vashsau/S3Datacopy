#class s3datacopy {
# }


# bucket and path parameters are mandatory

define s3datacopy(
  $bucket,
  $path,
  $src_filename = $name,
  $dst_filename = $name,
  $checksum = true
){

  $src_url = "s3://${bucket}/${src_filename}"
  $dst_path = "${path}/${dst_filename}"

  # os specific definitions

  if $::kernel =~ /Linux/ {
    $awsclipath = "/usr/bin"

  } elsif $::kernel =~ /windows/ {
    $awsclipath = 'C:\Program Files\Amazon\AWSCLI'
  }



if $checksum {

    exec { "s3datacopy_${src_url}":
	path => $awsclipath,
      command => "aws s3 cp ${src_url} ${dst_path}",

         }

  } else {

    exec { "s3datacopy_${src_url}":
      command => "aws s3 cp ${src_url} ${dst_path}",
    }
  }
}

