#!/bin/awk -f

# TODO src

/^$/{
	next
}
/^\s*#.*/{
	next
}
/^\[.*\]$/{
	hdr = $0
	next
}
a[hdr] != "" {
	a[hdr] = a[hdr] ORS $0
	next
}
{
	a[hdr] = $0
	seq[++n] = hdr
}
END {
	for (i=1; i <= n; i++)
		print seq[i] ORS a[seq[i]] (i<n ? ORS : "")
}

