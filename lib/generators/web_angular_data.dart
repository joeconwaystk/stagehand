// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

const List<String> data = const [
  ".gitignore",
  "text",
  """IyBGaWxlcyBhbmQgZGlyZWN0b3JpZXMgY3JlYXRlZCBieSBwdWIKLnBhY2thZ2VzCi5wdWIvCmJ1
aWxkLwojIFJlbW92ZSB0aGUgZm9sbG93aW5nIHBhdHRlcm4gaWYgeW91IHdpc2ggdG8gY2hlY2sg
aW4geW91ciBsb2NrIGZpbGUKcHVic3BlYy5sb2NrCgojIERpcmVjdG9yeSBjcmVhdGVkIGJ5IGRh
cnRkb2MKZG9jL2FwaS8K""",
  "CHANGELOG.md",
  "text",
  """IyBDaGFuZ2Vsb2cKCiMjIDAuMC4xCgotIEluaXRpYWwgdmVyc2lvbiwgY3JlYXRlZCBieSBTdGFn
ZWhhbmQK""",
  "LICENSE",
  "text",
  """Q29weXJpZ2h0IChjKSBfX3llYXJfXywgX19hdXRob3JfXy4KQWxsIHJpZ2h0cyByZXNlcnZlZC4K
ClJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dAptb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUg
Zm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoKICAgICogUmVkaXN0cmlidXRpb25zIG9mIHNv
dXJjZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKICAgICAgbm90aWNlLCB0
aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgogICAg
KiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3Zl
IGNvcHlyaWdodAogICAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUg
Zm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCiAgICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90
aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCiAgICAqIE5laXRo
ZXIgdGhlIG5hbWUgb2YgdGhlIDxvcmdhbml6YXRpb24+IG5vciB0aGUKICAgICAgbmFtZXMgb2Yg
aXRzIGNvbnRyaWJ1dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVj
dHMKICAgICAgZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlv
ciB3cml0dGVuIHBlcm1pc3Npb24uCgpUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRIRSBD
T1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTICJBUyBJUyIgQU5ECkFOWSBFWFBSRVNT
IE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRI
RSBJTVBMSUVECldBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUKRElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwgPENP
UFlSSUdIVCBIT0xERVI+IEJFIExJQUJMRSBGT1IgQU5ZCkRJUkVDVCwgSU5ESVJFQ1QsIElOQ0lE
RU5UQUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTCihJTkNM
VURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09E
UyBPUiBTRVJWSUNFUzsKTE9TUyBPRiBVU0UsIERBVEEsIE9SIFBST0ZJVFM7IE9SIEJVU0lORVNT
IElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5ECk9OIEFOWSBUSEVPUlkgT0YgTElBQklM
SVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUCihJTkNM
VURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0Yg
VEhFIFVTRSBPRiBUSElTClNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklM
SVRZIE9GIFNVQ0ggREFNQUdFLgo=""",
  "README.md",
  "text",
  """IyBBIHdlYiBhcHAgdGhhdCB1c2VzIEFuZ3VsYXJEYXJ0IENvbXBvbmVudHMKCkdlbmVyYXRlZCBi
eSBTdGFnZWhhbmQuIFNlZSBMSUNFTlNFLgo=""",
  "analysis_options.yaml",
  "text",
  """YW5hbHl6ZXI6CiAgc3Ryb25nLW1vZGU6IHRydWUKIyAgIGV4Y2x1ZGU6CiMgICAgIC0gcGF0aC90
by9leGNsdWRlZC9maWxlcy8qKgoKIyBMaW50IHJ1bGVzIGFuZCBkb2N1bWVudGF0aW9uLCBzZWUg
aHR0cDovL2RhcnQtbGFuZy5naXRodWIuaW8vbGludGVyL2xpbnRzCmxpbnRlcjoKICBydWxlczoK
ICAgIC0gY2FuY2VsX3N1YnNjcmlwdGlvbnMKICAgIC0gY2xvc2Vfc2lua3MKICAgIC0gaGFzaF9h
bmRfZXF1YWxzCiAgICAtIGl0ZXJhYmxlX2NvbnRhaW5zX3VucmVsYXRlZF90eXBlCiAgICAtIGxp
c3RfcmVtb3ZlX3VucmVsYXRlZF90eXBlCiAgICAtIHRlc3RfdHlwZXNfaW5fZXF1YWxzCiAgICAt
IHVucmVsYXRlZF90eXBlX2VxdWFsaXR5X2NoZWNrcwogICAgLSB2YWxpZF9yZWdleHBzCg==""",
  "lib/app_component.css",
  "text",
  """Omhvc3QgewogICAgLyogVGhpcyBpcyBlcXVpdmFsZW50IG9mIHRoZSAnYm9keScgc2VsZWN0b3Ig
b2YgYSBwYWdlLiAqLwp9CgouYmx1ZSB7CiAgYmFja2dyb3VuZC1jb2xvcjogIzIxOTZGMzsKICBj
b2xvcjogd2hpdGU7Cn0=""",
  "lib/app_component.dart",
  "text",
  """Ly8gQ29weXJpZ2h0IChjKSBfX3llYXJfXywgX19hdXRob3JfXy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4gVXNlIG9mIHRoaXMgc291cmNlIGNvZGUKLy8gaXMgZ292ZXJuZWQgYnkgYSBCU0Qtc3R5bGUg
bGljZW5zZSB0aGF0IGNhbiBiZSBmb3VuZCBpbiB0aGUgTElDRU5TRSBmaWxlLgoKaW1wb3J0ICdw
YWNrYWdlOmFuZ3VsYXIyL2NvcmUuZGFydCc7CmltcG9ydCAncGFja2FnZTphbmd1bGFyMl9jb21w
b25lbnRzL2FuZ3VsYXIyX2NvbXBvbmVudHMuZGFydCc7CgppbXBvcnQgJ2hlbGxvX2RpYWxvZy9o
ZWxsb19kaWFsb2cuZGFydCc7CgpAQ29tcG9uZW50KAogIHNlbGVjdG9yOiAnbXktYXBwJywKICBz
dHlsZVVybHM6IGNvbnN0IFsnYXBwX2NvbXBvbmVudC5jc3MnXSwKICB0ZW1wbGF0ZVVybDogJ2Fw
cF9jb21wb25lbnQuaHRtbCcsCiAgZGlyZWN0aXZlczogY29uc3QgW21hdGVyaWFsRGlyZWN0aXZl
cywgSGVsbG9EaWFsb2ddLAogIHByb3ZpZGVyczogY29uc3QgW21hdGVyaWFsUHJvdmlkZXJzXSwK
KQpjbGFzcyBBcHBDb21wb25lbnQgewogIC8vIE5vdGhpbmcgaGVyZSB5ZXQuIEFsbCBsb2dpYyBp
cyBpbiBIZWxsb0RpYWxvZy4KfQo=""",
  "lib/app_component.html",
  "text",
  """PGgxPk15IEZpcnN0IEFuZ3VsYXJEYXJ0IEFwcDwvaDE+Cgo8bWF0ZXJpYWwtaW5wdXQgI215SW5w
dXQKICAgICAgICAgICAgICAgIGxhYmVsPSJZb3VyIG5hbWUiCiAgICAgICAgICAgICAgICBmbG9h
dGluZ0xhYmVsCiAgICAgICAgICAgICAgICBhdXRvRm9jdXM+CjwvbWF0ZXJpYWwtaW5wdXQ+Cgo8
bWF0ZXJpYWwtYnV0dG9uIHJhaXNlZCAKICAgICAgICAgICAgICAgICAodHJpZ2dlcik9Im15RGlh
bG9nLm9wZW4oKSIKICAgICAgICAgICAgICAgICBjbGFzcz0iYmx1ZSI+CiAgICBTYXkgSGVsbG8K
PC9tYXRlcmlhbC1idXR0b24+Cgo8aGVsbG8tZGlhbG9nICNteURpYWxvZwogICAgICAgICAgICAg
W25hbWVdPSJteUlucHV0LmlucHV0VGV4dCI+CjwvaGVsbG8tZGlhbG9nPg==""",
  "lib/hello_dialog/hello_dialog.css",
  "text",
  "YSB7CiAgdGV4dC1kZWNvcmF0aW9uOiBub25lOwp9",
  "lib/hello_dialog/hello_dialog.dart",
  "text",
  """Ly8gQ29weXJpZ2h0IChjKSBfX3llYXJfXywgX19hdXRob3JfXy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4gVXNlIG9mIHRoaXMgc291cmNlIGNvZGUKLy8gaXMgZ292ZXJuZWQgYnkgYSBCU0Qtc3R5bGUg
bGljZW5zZSB0aGF0IGNhbiBiZSBmb3VuZCBpbiB0aGUgTElDRU5TRSBmaWxlLgoKaW1wb3J0ICdw
YWNrYWdlOmFuZ3VsYXIyL2NvcmUuZGFydCc7CmltcG9ydCAncGFja2FnZTphbmd1bGFyMl9jb21w
b25lbnRzL2FuZ3VsYXIyX2NvbXBvbmVudHMuZGFydCc7CgpAQ29tcG9uZW50KAogIHNlbGVjdG9y
OiAnaGVsbG8tZGlhbG9nJywKICBzdHlsZVVybHM6IGNvbnN0IFsnaGVsbG9fZGlhbG9nLmNzcydd
LAogIHRlbXBsYXRlVXJsOiAnaGVsbG9fZGlhbG9nLmh0bWwnLAogIGRpcmVjdGl2ZXM6IGNvbnN0
IFttYXRlcmlhbERpcmVjdGl2ZXNdLAogIHByb3ZpZGVyczogY29uc3QgW21hdGVyaWFsUHJvdmlk
ZXJzXSwKKQpjbGFzcyBIZWxsb0RpYWxvZyB7CiAgLy8vIE1vZGFsIGNvbXBvbmVudCB0aGF0IGhv
c3RzIHRoZSBpbm5lciBNYXRlcmlhbERpYWxvZyBpbiBhIGNlbnRlcmVkIG92ZXJsYXkuCiAgQFZp
ZXdDaGlsZCgnd3JhcHBpbmdNb2RhbCcpCiAgTW9kYWxDb21wb25lbnQgd3JhcHBpbmdNb2RhbDsK
CiAgLy8vIE5hbWUgb2YgdXNlci4KICBASW5wdXQoKQogIFN0cmluZyBuYW1lID0gIiI7CgogIC8v
LyBPcGVucyB0aGUgZGlhbG9nLgogIHZvaWQgb3BlbihbU3RyaW5nIG5hbWVdKSB7CiAgICBpZiAo
bmFtZSAhPSBudWxsKSB0aGlzLm5hbWUgPSBuYW1lOwogICAgd3JhcHBpbmdNb2RhbC5vcGVuKCk7
CiAgfQp9Cg==""",
  "lib/hello_dialog/hello_dialog.html",
  "text",
  """PG1vZGFsICN3cmFwcGluZ01vZGFsPgogIDxtYXRlcmlhbC1kaWFsb2c+CgogICAgPGgzIGhlYWRl
cj4KICAgICAgICBIZWxsbywge3sgbmFtZSA9PSAnJyA/ICdteXN0ZXJpb3VzIHN0cmFuZ2VyJyA6
IG5hbWUgfX0hCiAgICA8L2gzPgoKICAgIDxwPgogICAgICBDb250aW51ZSB5b3VyIGpvdXJuZXkg
b24KICAgICAgPGEgaHJlZj0iaHR0cHM6Ly93ZWJkZXYuZGFydGxhbmcub3JnL2FuZ3VsYXIiPndl
YmRldi5kYXJ0bGFuZy5vcmcvYW5ndWxhcjwvYT4uCiAgICA8L3A+CgogICAgPGRpdiBmb290ZXI+
CiAgICAgIDxtYXRlcmlhbC1idXR0b24gYXV0b0ZvY3VzCiAgICAgICAgICAgICAgICAgICAgICAg
Y2xlYXItc2l6ZQogICAgICAgICAgICAgICAgICAgICAgICh0cmlnZ2VyKT0id3JhcHBpbmdNb2Rh
bC5jbG9zZSgpIj4KICAgICAgICBDbG9zZQogICAgICA8L21hdGVyaWFsLWJ1dHRvbj4KICAgIDwv
ZGl2PgogIDwvbWF0ZXJpYWwtZGlhbG9nPgo8L21vZGFsPg==""",
  "pubspec.yaml",
  "text",
  """bmFtZTogX19wcm9qZWN0TmFtZV9fCmRlc2NyaXB0aW9uOiBBIHdlYiBhcHAgdGhhdCB1c2VzIEFu
Z3VsYXJEYXJ0IENvbXBvbmVudHMKdmVyc2lvbjogMC4wLjEKI2hvbWVwYWdlOiBodHRwczovL3d3
dy5leGFtcGxlLmNvbQojYXV0aG9yOiBfX2F1dGhvcl9fIDxlbWFpbEBleGFtcGxlLmNvbT4KCmVu
dmlyb25tZW50OgogIHNkazogJz49MS4yMy4wIDwyLjAuMCcKCmRlcGVuZGVuY2llczoKICBhbmd1
bGFyMjogXjMuMC4wLWJldGErMQogIGFuZ3VsYXIyX2NvbXBvbmVudHM6IF4wLjQuMS1iZXRhCgpk
ZXZfZGVwZW5kZW5jaWVzOgogIGJyb3dzZXI6IF4wLjEwLjAKICBkYXJ0X3RvX2pzX3NjcmlwdF9y
ZXdyaXRlcjogXjEuMC4xCgp0cmFuc2Zvcm1lcnM6Ci0gYW5ndWxhcjI6CiAgICBwbGF0Zm9ybV9k
aXJlY3RpdmVzOgogICAgLSAncGFja2FnZTphbmd1bGFyMi9jb21tb24uZGFydCNDT01NT05fRElS
RUNUSVZFUycKICAgIHBsYXRmb3JtX3BpcGVzOgogICAgLSAncGFja2FnZTphbmd1bGFyMi9jb21t
b24uZGFydCNDT01NT05fUElQRVMnCiAgICBlbnRyeV9wb2ludHM6IHdlYi9tYWluLmRhcnQKLSBk
YXJ0X3RvX2pzX3NjcmlwdF9yZXdyaXRlcgo=""",
  "web/index.html",
  "text",
  """PCFET0NUWVBFIGh0bWw+CjxodG1sPgogIDxoZWFkPgogICAgPHNjcmlwdD4KICAgICAgICAvLyBX
QVJOSU5HOiBETyBOT1Qgc2V0IHRoZSA8YmFzZSBocmVmPiBsaWtlIHRoaXMgaW4gcHJvZHVjdGlv
biEKICAgICAgICAvLyBEZXRhaWxzOiBodHRwczovL3dlYmRldi5kYXJ0bGFuZy5vcmcvYW5ndWxh
ci9ndWlkZS9yb3V0ZXIKICAgICAgICAoZnVuY3Rpb24gKCkgewogICAgICAgICAgICAvLyBBcHAg
YmVpbmcgc2VydmVkIG91dCBvZiB3ZWIgZm9sZGVyIChsaWtlIFdlYlN0b3JtIGRvZXMpPwogICAg
ICAgICAgICB2YXIgbWF0Y2ggPSBkb2N1bWVudC5sb2NhdGlvbi5wYXRobmFtZS5tYXRjaCgvXlwv
Wy1cd10rXC93ZWJcLy8pOwogICAgICAgICAgICB2YXIgaHJlZiA9IG1hdGNoID8gbWF0Y2hbMF0g
OiAnLyc7CiAgICAgICAgICAgIGRvY3VtZW50LndyaXRlKCc8YmFzZSBocmVmPSInICsgaHJlZiAr
ICciIC8+Jyk7CiAgICAgICAgfSgpKTsKICAgIDwvc2NyaXB0PgoKICAgIDx0aXRsZT5fX3Byb2pl
Y3ROYW1lX188L3RpdGxlPgogICAgPG1ldGEgY2hhcnNldD0idXRmLTgiPgogICAgPG1ldGEgbmFt
ZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13aWR0aCwgaW5pdGlhbC1zY2FsZT0x
Ij4KCiAgICA8c2NyaXB0IGRlZmVyIHNyYz0ibWFpbi5kYXJ0IiB0eXBlPSJhcHBsaWNhdGlvbi9k
YXJ0Ij48L3NjcmlwdD4KICAgIDxzY3JpcHQgZGVmZXIgc3JjPSJwYWNrYWdlcy9icm93c2VyL2Rh
cnQuanMiPjwvc2NyaXB0PgogICAgPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBocmVmPSJzdHlsZXMu
Y3NzIj4KICA8L2hlYWQ+CiAgPGJvZHk+CiAgICA8bXktYXBwPkxvYWRpbmcuLi48L215LWFwcD4K
ICA8L2JvZHk+CjwvaHRtbD4K""",
  "web/main.dart",
  "text",
  """Ly8gQ29weXJpZ2h0IChjKSBfX3llYXJfXywgX19hdXRob3JfXy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4gVXNlIG9mIHRoaXMgc291cmNlIGNvZGUKLy8gaXMgZ292ZXJuZWQgYnkgYSBCU0Qtc3R5bGUg
bGljZW5zZSB0aGF0IGNhbiBiZSBmb3VuZCBpbiB0aGUgTElDRU5TRSBmaWxlLgoKaW1wb3J0ICdw
YWNrYWdlOmFuZ3VsYXIyL3BsYXRmb3JtL2Jyb3dzZXIuZGFydCc7CgppbXBvcnQgJ3BhY2thZ2U6
X19wcm9qZWN0TmFtZV9fL2FwcF9jb21wb25lbnQuZGFydCc7Cgp2b2lkIG1haW4oKSB7CiAgYm9v
dHN0cmFwKEFwcENvbXBvbmVudCk7Cn0K""",
  "web/styles.css",
  "text",
  """LyogQ29weXJpZ2h0IChjKSBfX3llYXJfXywgX19hdXRob3JfXy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4gVXNlIG9mIHRoaXMgc291cmNlIGNvZGUKICAgaXMgZ292ZXJuZWQgYnkgYSBCU0Qtc3R5bGUg
bGljZW5zZSB0aGF0IGNhbiBiZSBmb3VuZCBpbiB0aGUgTElDRU5TRSBmaWxlLiAqLwoKQGltcG9y
dCB1cmwoaHR0cHM6Ly9mb250cy5nb29nbGVhcGlzLmNvbS9jc3M/ZmFtaWx5PVJvYm90byk7CkBp
bXBvcnQgdXJsKGh0dHBzOi8vZm9udHMuZ29vZ2xlYXBpcy5jb20vY3NzP2ZhbWlseT1NYXRlcmlh
bCtJY29ucyk7Cgpib2R5IHsKICBtYXgtd2lkdGg6IDYwMHB4OwogIG1hcmdpbjogMCBhdXRvOwog
IHBhZGRpbmc6IDV2dzsKfQoKKiB7CiAgZm9udC1mYW1pbHk6IFJvYm90bywgSGVsdmV0aWNhLCBB
cmlhbCwgc2Fucy1zZXJpZjsKfQo="""
];
