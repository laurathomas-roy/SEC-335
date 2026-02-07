param($prefix, $server)

for($i=0; $i -le 254; $i++) {
    $network = "$prefix.$i"
    $up = Resolve-DnsName -Name $network -Server $server -ErrorAction SilentlyContinue

    foreach ($j in $up) {
        if ($j.NameHost) {
            Write-Host "$network $($j.NameHost)"
        }
    }
}