



if ( $my_infile.Length -gt 0 ) {
  [string] $full_name_infile = $my_dir + "\" + $my_infile
  $f1 = Get-Content($full_name_infile) -ErrorAction Stop
  if ( $f1.count -gt 0 ) { 
       [string] $fout1_dir = $my_dir 
       [string] $fout1_name = $fout1_dir + "\"  + $my_infile + ".temp"
       $fmode = [System.IO.FileMode]::Append
       $faccess = [System.IO.FileAccess]::Write
       $fshare = [System.IO.FileShare]::None
       $fencode = [System.Text.ASCIIEncoding]::ASCII
       $stream1 = New-Object System.IO.FileStream $fout1_name, $fmode, $faccess, $fshare
       $fout1 = new-object System.IO.StreamWriter $stream1, $fencode
  }

  for ( $x=0; $x -lt $f1.count; $x++ ) {
    $line = $f1.Get( $x )
    if ( $line.length -eq 0 ) {
       $nop=1
    } else {
         if (  $line.Substring( $line.Length-1 , 1 ) -eq "," ) { $line = $line + " "; }
         $fout1.WriteLine( $line );
    }

  }
  $fout1.Close()
  $fout1.Dispose()
  move-item  $fout1_name $full_name_infile -force 
}  


