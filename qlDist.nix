# This file is machine generated.  Do not edit it!
{ fetchurl }:
let
  qlReleases =
    {
      "alexandria" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/alexandria/2021-08-07/alexandria-20210807-git.tgz";
          sha256 = "0y2x3xapx06v8083ls4pz12s63gv33d6ix05r61m62h4qqm8qk3j";
        };
        name = "alexandria";
        archiveName = "alexandria-20210807-git.tgz";
        archiveSize = 55809;
        archiveMD5 = "0193fd1a1d702b4a0fafa19361b1e644";
        archiveContentSHA1 = "ff8a06fba710215367b9c3a1fe69f2394b5536b4";
        prefix = "alexandria-20210807-git";
        systemFiles = [
          "alexandria.asd"
        ];
      };
      "array-utils" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/array-utils/2020-12-20/array-utils-20201220-git.tgz";
          sha256 = "11y6k8gzzcj00jyccg2k9nh6rvivcvh23z4yzjfly7adygd3n717";
        };
        name = "array-utils";
        archiveName = "array-utils-20201220-git.tgz";
        archiveSize = 5803;
        archiveMD5 = "d6ed906f28c46b2ab0335ec1fc05f8af";
        archiveContentSHA1 = "85f9c248fbda36cb4b09f5b4729c31e27abcae53";
        prefix = "array-utils-20201220-git";
        systemFiles = [
          "array-utils.asd"
        ];
      };
      "babel" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/babel/2020-09-25/babel-20200925-git.tgz";
          sha256 = "1hpjm2whw7zla9igzj50y3nibii0mfg2a6y6nslaf5vpkni88jfi";
        };
        name = "babel";
        archiveName = "babel-20200925-git.tgz";
        archiveSize = 273336;
        archiveMD5 = "7f64d3be80bcba19d9caeaede5dea6d8";
        archiveContentSHA1 = "3883704943f463c50718758d466e69d9cc794965";
        prefix = "babel-20200925-git";
        systemFiles = [
          "babel.asd"
        ];
      };
      "bordeaux-threads" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/bordeaux-threads/2020-06-10/bordeaux-threads-v0.8.8.tgz";
          sha256 = "1ppb7lvr796k1j4hi0jnp717v9zxy6vq4f5cyzgn7svg1ic6l0pp";
        };
        name = "bordeaux-threads";
        archiveName = "bordeaux-threads-v0.8.8.tgz";
        archiveSize = 23709;
        archiveMD5 = "1922316721bcaa10142ed07c31b178e5";
        archiveContentSHA1 = "3a3df476335f1d101e09fd7a93b2de42076fc87b";
        prefix = "bordeaux-threads-v0.8.8";
        systemFiles = [
          "bordeaux-threads.asd"
        ];
      };
      "cffi" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cffi/2021-04-11/cffi_0.24.1.tgz";
          sha256 = "1ir8a4rrnilj9f8rv1hh6fhkg2wp8z8zcf9hiijcix50pabxq8qh";
        };
        name = "cffi";
        archiveName = "cffi_0.24.1.tgz";
        archiveSize = 262118;
        archiveMD5 = "c3df5c460e00e5af8b8bd2cd03a4b5cc";
        archiveContentSHA1 = "e2767d598164ea88c0aa74a99efb2c0314a00506";
        prefix = "cffi_0.24.1";
        systemFiles = [
          "cffi-grovel.asd"
          "cffi-toolchain.asd"
          "cffi.asd"
        ];
      };
      "chipz" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/chipz/2021-08-07/chipz-20210807-git.tgz";
          sha256 = "0g7xhh4yq9azjq7gnszaq2kbxima2q30apb3rrglc1ign973hr8x";
        };
        name = "chipz";
        archiveName = "chipz-20210807-git.tgz";
        archiveSize = 37076;
        archiveMD5 = "11438e3bc60c39294c337cb232ae8040";
        archiveContentSHA1 = "8c4bb4deb9cf83ee97ba46d04541a19bc22fb371";
        prefix = "chipz-20210807-git";
        systemFiles = [
          "chipz.asd"
        ];
      };
      "chunga" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/chunga/2020-04-27/chunga-20200427-git.tgz";
          sha256 = "0p6dlnan6raincd682brcjbklyvmkfkhz0yzp2bkfw67s9615bkk";
        };
        name = "chunga";
        archiveName = "chunga-20200427-git.tgz";
        archiveSize = 20599;
        archiveMD5 = "ec31aa63a1b594a197ad45e5e65c4cc4";
        archiveContentSHA1 = "7a341e0e55681847160bce6941e8aec36f928228";
        prefix = "chunga-20200427-git";
        systemFiles = [
          "chunga.asd"
        ];
      };
      "cl+ssl" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl+ssl/2021-08-07/cl+ssl-20210807-git.tgz";
          sha256 = "04kk392r7w5xq414vaf3wnkrlhczdn863x3jj3vmrp7ppr9cwy57";
        };
        name = "cl+ssl";
        archiveName = "cl+ssl-20210807-git.tgz";
        archiveSize = 63868;
        archiveMD5 = "d2267b96fcd5ee4ad2f9fc11a7a3f0b2";
        archiveContentSHA1 = "a18cd527308729c2665709780b88aaff399b0915";
        prefix = "cl+ssl-20210807-git";
        systemFiles = [
          "cl+ssl.asd"
        ];
      };
      "cl-base64" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-base64/2020-10-16/cl-base64-20201016-git.tgz";
          sha256 = "1wd2sgvfrivrbzlhs1vgj762jqz7sk171ssli6gl1kfwbnphzx9z";
        };
        name = "cl-base64";
        archiveName = "cl-base64-20201016-git.tgz";
        archiveSize = 10373;
        archiveMD5 = "f556f7c61f785c84abdc1beb63c906ae";
        archiveContentSHA1 = "f995d12a8885d3738a7ddea4ea8ef00ca8c88a2a";
        prefix = "cl-base64-20201016-git";
        systemFiles = [
          "cl-base64.asd"
        ];
      };
      "cl-change-case" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-change-case/2021-04-11/cl-change-case-20210411-git.tgz";
          sha256 = "14s26b907h1nsnwdqbj6j4c9bvc4rc2l8ry2q1j7ibjfzqvhp4mj";
        };
        name = "cl-change-case";
        archiveName = "cl-change-case-20210411-git.tgz";
        archiveSize = 4792;
        archiveMD5 = "df72a3d71a6c65e149704688aec859b9";
        archiveContentSHA1 = "d19d49e30d952a38429ac25dc2005999bcfe003c";
        prefix = "cl-change-case-20210411-git";
        systemFiles = [
          "cl-change-case.asd"
        ];
      };
      "cl-cookie" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-cookie/2019-10-07/cl-cookie-20191007-git.tgz";
          sha256 = "1xcb69n3qfp37nwj0mj2whf3yj5xfsgh9sdw6c64gxqkiiq9nfhh";
        };
        name = "cl-cookie";
        archiveName = "cl-cookie-20191007-git.tgz";
        archiveSize = 4880;
        archiveMD5 = "37595a6705fdd77415b859aea90d30bc";
        archiveContentSHA1 = "c1dad8b9e287398c5f909af268f1b3908dabc760";
        prefix = "cl-cookie-20191007-git";
        systemFiles = [
          "cl-cookie.asd"
        ];
      };
      "cl-ppcre" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-ppcre/2019-05-21/cl-ppcre-20190521-git.tgz";
          sha256 = "0p6jcvf9afnsg80a1zqsp7fyz0lf1fxzbin7rs9bl4i6jvm0hjqx";
        };
        name = "cl-ppcre";
        archiveName = "cl-ppcre-20190521-git.tgz";
        archiveSize = 155009;
        archiveMD5 = "a980b75c1b386b49bcb28107991eb4ec";
        archiveContentSHA1 = "d6593d8f842bcf6af810ff93c6c02b757bd49ecf";
        prefix = "cl-ppcre-20190521-git";
        systemFiles = [
          "cl-ppcre-unicode.asd"
          "cl-ppcre.asd"
        ];
      };
      "cl-reexport" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-reexport/2021-02-28/cl-reexport-20210228-git.tgz";
          sha256 = "1ay0ng5nnbq200g4wxs0h7byx24za4yk208nhfsmksahk5qj1qra";
        };
        name = "cl-reexport";
        archiveName = "cl-reexport-20210228-git.tgz";
        archiveSize = 2538;
        archiveMD5 = "e083a9c49fe39d65f1ff7743eebe37c2";
        archiveContentSHA1 = "8b85c2ce95d178aa2deab798f8fc16dd4a0de6da";
        prefix = "cl-reexport-20210228-git";
        systemFiles = [
          "cl-reexport.asd"
        ];
      };
      "cl-str" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-str/2021-05-31/cl-str-20210531-git.tgz";
          sha256 = "16z1axfik0s2m74ly4bxlrv4mbd2r923y7nrrrc487fsjs3v23bb";
        };
        name = "cl-str";
        archiveName = "cl-str-20210531-git.tgz";
        archiveSize = 18498;
        archiveMD5 = "05144979ce1bf382fdb0b91db932fe6a";
        archiveContentSHA1 = "bf58ebc7920e97012ce5b9370eb2418e9bd1d70d";
        prefix = "cl-str-20210531-git";
        systemFiles = [
          "str.asd"
        ];
      };
      "cl-unicode" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-unicode/2021-02-28/cl-unicode-20210228-git.tgz";
          sha256 = "0phy5wppb7m78dixrf2vjq8vas4drfd4qg38al6q8ymkl0yfy5js";
        };
        name = "cl-unicode";
        archiveName = "cl-unicode-20210228-git.tgz";
        archiveSize = 1290638;
        archiveMD5 = "5b3bdddde3be5b8427e3fac92495a10b";
        archiveContentSHA1 = "178c37695c1679ca23ec02e48e9942e820640615";
        prefix = "cl-unicode-20210228-git";
        systemFiles = [
          "cl-unicode.asd"
        ];
      };
      "cl-utilities" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/cl-utilities/2010-10-06/cl-utilities-1.2.4.tgz";
          sha256 = "1z2ippnv2wgyxpz15zpif7j7sp1r20fkjhm4n6am2fyp6a3k3a87";
        };
        name = "cl-utilities";
        archiveName = "cl-utilities-1.2.4.tgz";
        archiveSize = 22998;
        archiveMD5 = "c3a4ba38b627448d3ed40ce888048940";
        archiveContentSHA1 = "187862251617676b95b1386e277fb2c449472bf8";
        prefix = "cl-utilities-1.2.4";
        systemFiles = [
          "cl-utilities.asd"
        ];
      };
      "clss" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/clss/2019-11-30/clss-20191130-git.tgz";
          sha256 = "0cbjzsc90fpa8zqv5s0ri7ncbv6f8azgbbfsxswqfphbibkcpcka";
        };
        name = "clss";
        archiveName = "clss-20191130-git.tgz";
        archiveSize = 20000;
        archiveMD5 = "9910677b36df00f3046905a9b84122a9";
        archiveContentSHA1 = "440121bc862ddcd72c421df4ade798ecfb26242a";
        prefix = "clss-20191130-git";
        systemFiles = [
          "clss.asd"
        ];
      };
      "dexador" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/dexador/2021-08-07/dexador-20210807-git.tgz";
          sha256 = "04x29nr2h70b08yail6mf2pgpcgqwx3zxdizkzrj4mv6mi8pdy29";
        };
        name = "dexador";
        archiveName = "dexador-20210807-git.tgz";
        archiveSize = 206120;
        archiveMD5 = "92b460917f8fa1c668c770fa850de5c7";
        archiveContentSHA1 = "d087af33a5baf4e223b5518af3939bf504efc18d";
        prefix = "dexador-20210807-git";
        systemFiles = [
          "dexador.asd"
        ];
      };
      "documentation-utils" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/documentation-utils/2019-07-10/documentation-utils-20190710-git.tgz";
          sha256 = "1n3z8sw75k2jjpsg6ch5g9s4v56y96dbs4338ajrfdsk3pk4wgj3";
        };
        name = "documentation-utils";
        archiveName = "documentation-utils-20190710-git.tgz";
        archiveSize = 8913;
        archiveMD5 = "4f45f511ac55008b8b8aa04f7feaa2d4";
        archiveContentSHA1 = "1071335af99636f62943713298b46a0244b5bda4";
        prefix = "documentation-utils-20190710-git";
        systemFiles = [
          "documentation-utils.asd"
        ];
      };
      "fast-http" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/fast-http/2019-10-07/fast-http-20191007-git.tgz";
          sha256 = "00qnl56cfss2blm4pp03dwv84bmkyd0kbarhahclxbn8f7pgwf32";
        };
        name = "fast-http";
        archiveName = "fast-http-20191007-git.tgz";
        archiveSize = 33540;
        archiveMD5 = "fd43be4dd72fd9bda5a3ecce87104c97";
        archiveContentSHA1 = "419610a07b0ccf3117378b6fb9b5faa025037d0b";
        prefix = "fast-http-20191007-git";
        systemFiles = [
          "fast-http.asd"
        ];
      };
      "fast-io" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/fast-io/2020-09-25/fast-io-20200925-git.tgz";
          sha256 = "1rgyr6y20fp3jqnx5snpjf9lngzalip2a28l04ssypwagmhaa975";
        };
        name = "fast-io";
        archiveName = "fast-io-20200925-git.tgz";
        archiveSize = 9137;
        archiveMD5 = "aa948bd29b8733f08e79a60226243117";
        archiveContentSHA1 = "0b3667be6122431040441fa1dc0bf29a3900cdad";
        prefix = "fast-io-20200925-git";
        systemFiles = [
          "fast-io.asd"
        ];
      };
      "flexi-streams" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/flexi-streams/2021-08-07/flexi-streams-20210807-git.tgz";
          sha256 = "1g2cvz0bjigr6lw3gigdwcm1x1w0pcyr3ainnix9wyp1kxc2n2rw";
        };
        name = "flexi-streams";
        archiveName = "flexi-streams-20210807-git.tgz";
        archiveSize = 445826;
        archiveMD5 = "6c026daab0766c11f5aee9cc3df3394e";
        archiveContentSHA1 = "2f04ab423f3e13bad09bf311dd863838fec643be";
        prefix = "flexi-streams-20210807-git";
        systemFiles = [
          "flexi-streams.asd"
        ];
      };
      "form-fiddle" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/form-fiddle/2019-07-10/form-fiddle-20190710-git.tgz";
          sha256 = "12zmqm2vls043kaka7jp6pnsvkxlyv6x183yjyrs8jk461qfydwl";
        };
        name = "form-fiddle";
        archiveName = "form-fiddle-20190710-git.tgz";
        archiveSize = 5635;
        archiveMD5 = "2576065de1e3c95751285fb155f5bcf6";
        archiveContentSHA1 = "a6a057c05e5512f2f8a0a05e336d422646d76b2c";
        prefix = "form-fiddle-20190710-git";
        systemFiles = [
          "form-fiddle.asd"
        ];
      };
      "local-time" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/local-time/2021-01-24/local-time-20210124-git.tgz";
          sha256 = "0bz5z0rd8gfd22bpqkalaijxlrk806zc010cvgd4qjapbrxzjg3s";
        };
        name = "local-time";
        archiveName = "local-time-20210124-git.tgz";
        archiveSize = 779489;
        archiveMD5 = "631d67bc84ae838792717b256f2cdbaf";
        archiveContentSHA1 = "9a37cd4dc34ff1bc461447d4e8f6922f31f1259f";
        prefix = "local-time-20210124-git";
        systemFiles = [
          "local-time.asd"
        ];
      };
      "lquery" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/lquery/2020-12-20/lquery-20201220-git.tgz";
          sha256 = "0mfnk1p73aihraklw802j5mjgc8cjxva0mdf0c4p7b253crf15jx";
        };
        name = "lquery";
        archiveName = "lquery-20201220-git.tgz";
        archiveSize = 38666;
        archiveMD5 = "a71685848959cf33cd6963b4a5f9e2ed";
        archiveContentSHA1 = "9ffafbe59d6488fad110339e51db5bc7cf048a62";
        prefix = "lquery-20201220-git";
        systemFiles = [
          "lquery.asd"
        ];
      };
      "plump" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/plump/2021-06-30/plump-20210630-git.tgz";
          sha256 = "0wx5l2q5hsdshdrmlpnjdlyksw6rl5f2snad18xkmmyiwwn7wv2h";
        };
        name = "plump";
        archiveName = "plump-20210630-git.tgz";
        archiveSize = 51131;
        archiveMD5 = "b15f7f4f52893ef41ca8a12e6e959dc1";
        archiveContentSHA1 = "49243ed04c86230e5bc14ab37bd70749159f9ddf";
        prefix = "plump-20210630-git";
        systemFiles = [
          "plump.asd"
        ];
      };
      "proc-parse" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/proc-parse/2019-08-13/proc-parse-20190813-git.tgz";
          sha256 = "126l7mqxjcgw2limddgrdq63cdhwkhaxabxl9l0bjadf92nczg0j";
        };
        name = "proc-parse";
        archiveName = "proc-parse-20190813-git.tgz";
        archiveSize = 8695;
        archiveMD5 = "99bdce79943071267c6a877d8de246c5";
        archiveContentSHA1 = "18fff39d2a228aeb60547154bb09745d2a8769e1";
        prefix = "proc-parse-20190813-git";
        systemFiles = [
          "proc-parse.asd"
        ];
      };
      "quri" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/quri/2021-06-30/quri-20210630-git.tgz";
          sha256 = "0ihgsqdzi9rh8ybc221g46c5h7i4vrz67znwv76rm2z44v8x0wwh";
        };
        name = "quri";
        archiveName = "quri-20210630-git.tgz";
        archiveSize = 70790;
        archiveMD5 = "3dcaaa9b94f6e4a0c5f4bd0829a045a7";
        archiveContentSHA1 = "39ad4cad4c6979fa4a15f85af578e5dd18e1791f";
        prefix = "quri-20210630-git";
        systemFiles = [
          "quri.asd"
        ];
      };
      "smart-buffer" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/smart-buffer/2021-06-30/smart-buffer-20210630-git.tgz";
          sha256 = "1j90cig9nkh9bim1h0jmgi73q8j3sja6bnn18bb85lalng0p4c2p";
        };
        name = "smart-buffer";
        archiveName = "smart-buffer-20210630-git.tgz";
        archiveSize = 3390;
        archiveMD5 = "3533a4884c2c7852961377366627727a";
        archiveContentSHA1 = "2ae5097cb922bc672cd9c151556f46f75186c53f";
        prefix = "smart-buffer-20210630-git";
        systemFiles = [
          "smart-buffer.asd"
        ];
      };
      "split-sequence" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/split-sequence/2021-05-31/split-sequence-v2.0.1.tgz";
          sha256 = "0x6jdpx5nwby0mjhavqzbfr97725jaryvawjj2f5w9z2s4m9ciya";
        };
        name = "split-sequence";
        archiveName = "split-sequence-v2.0.1.tgz";
        archiveSize = 11705;
        archiveMD5 = "871be321b4dbca0a1f958927e9173795";
        archiveContentSHA1 = "fe250d09a3d2b24a0459bebef9ccf401a4733475";
        prefix = "split-sequence-v2.0.1";
        systemFiles = [
          "split-sequence.asd"
        ];
      };
      "static-vectors" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/static-vectors/2021-06-30/static-vectors-v1.8.9.tgz";
          sha256 = "01n4iz6s4n57gmxscnj9aign60kh6gp7ak5waqz5zwhsdklgj0j4";
        };
        name = "static-vectors";
        archiveName = "static-vectors-v1.8.9.tgz";
        archiveSize = 6982;
        archiveMD5 = "f14b819c0d55e7fbd28e9b4a0bb3bfc9";
        archiveContentSHA1 = "baf9cd392bc3f9f61a6e2c35419348f38c8f1847";
        prefix = "static-vectors-v1.8.9";
        systemFiles = [
          "static-vectors.asd"
        ];
      };
      "trivial-features" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/trivial-features/2021-04-11/trivial-features-20210411-git.tgz";
          sha256 = "0z6nzql8z7bz8kzd08mh36h0r54vqx7pwigy8r617jhvb0r0n0n4";
        };
        name = "trivial-features";
        archiveName = "trivial-features-20210411-git.tgz";
        archiveSize = 11355;
        archiveMD5 = "5ec554fff48d38af5023604a1ae42d3a";
        archiveContentSHA1 = "8e63ad0e199315539323ca795e85c4f8c8a8fef9";
        prefix = "trivial-features-20210411-git";
        systemFiles = [
          "trivial-features.asd"
        ];
      };
      "trivial-garbage" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/trivial-garbage/2020-09-25/trivial-garbage-20200925-git.tgz";
          sha256 = "00iw2iw6qzji9b2gwy798l54jdk185sxh1k7m2qd9srs8s730k83";
        };
        name = "trivial-garbage";
        archiveName = "trivial-garbage-20200925-git.tgz";
        archiveSize = 10656;
        archiveMD5 = "9d748d1d549f419ce474f35906707420";
        archiveContentSHA1 = "9cec7b086ec7e137d4ffe8cb102ad57ae30d2aab";
        prefix = "trivial-garbage-20200925-git";
        systemFiles = [
          "trivial-garbage.asd"
        ];
      };
      "trivial-gray-streams" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/trivial-gray-streams/2021-01-24/trivial-gray-streams-20210124-git.tgz";
          sha256 = "0swqcw3649279qyn5lc42xqgi13jc4kd7hf3iasf4vfli8lhb3n6";
        };
        name = "trivial-gray-streams";
        archiveName = "trivial-gray-streams-20210124-git.tgz";
        archiveSize = 8046;
        archiveMD5 = "1b93af1cae9f8465d813964db4d10588";
        archiveContentSHA1 = "1a899121477a783ea3996c9875f44db44e8cd089";
        prefix = "trivial-gray-streams-20210124-git";
        systemFiles = [
          "trivial-gray-streams.asd"
        ];
      };
      "trivial-indent" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/trivial-indent/2021-05-31/trivial-indent-20210531-git.tgz";
          sha256 = "1nqkay4kwy365q1qlba07q9x5ng0sxrcii4fpjqcd8nwbx3kbm8b";
        };
        name = "trivial-indent";
        archiveName = "trivial-indent-20210531-git.tgz";
        archiveSize = 3564;
        archiveMD5 = "3bb7d208d9d0614121c1f57fcffe65c7";
        archiveContentSHA1 = "b5282042ed3f4b8dfdefba8665f0f56bdce6baaa";
        prefix = "trivial-indent-20210531-git";
        systemFiles = [
          "trivial-indent.asd"
        ];
      };
      "trivial-mimes" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/trivial-mimes/2020-07-15/trivial-mimes-20200715-git.tgz";
          sha256 = "10mk1v5ad0m3bg5pl7lqhh827jvg5jb896807vmi8wznwk7zaif1";
        };
        name = "trivial-mimes";
        archiveName = "trivial-mimes-20200715-git.tgz";
        archiveSize = 20336;
        archiveMD5 = "6f400805470232e87b3f69b9239b2b55";
        archiveContentSHA1 = "544b5a91142e69a5dc7aeaca6147a01afc9a9c7d";
        prefix = "trivial-mimes-20200715-git";
        systemFiles = [
          "trivial-mimes.asd"
        ];
      };
      "uiop" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/uiop/2021-08-07/uiop-3.3.5.tgz";
          sha256 = "19bskbcv413ix2rjqlbj9y62qbm6780s5i7h00rvpd488nnrvaqk";
        };
        name = "uiop";
        archiveName = "uiop-3.3.5.tgz";
        archiveSize = 103922;
        archiveMD5 = "831138297c2ac03189d25bb6b03b919c";
        archiveContentSHA1 = "e78de3f8e3ce5145d7a843ffafbf6131a02a1229";
        prefix = "uiop-3.3.5";
        systemFiles = [
          "uiop.asd"
        ];
      };
      "unix-opts" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/unix-opts/2021-01-24/unix-opts-20210124-git.tgz";
          sha256 = "1gjjav035n6297vgc4wi3i64516b8sdyi0d02q0nwicciwg6mwsn";
        };
        name = "unix-opts";
        archiveName = "unix-opts-20210124-git.tgz";
        archiveSize = 15695;
        archiveMD5 = "c75d3233c0f2e16793b1ce19bfc83811";
        archiveContentSHA1 = "89b779761b8146989d5272ae5323728e86aac92f";
        prefix = "unix-opts-20210124-git";
        systemFiles = [
          "unix-opts.asd"
        ];
      };
      "usocket" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/usocket/2019-12-27/usocket-0.8.3.tgz";
          sha256 = "19gl72r9jqms8slzn7i7bww2cqng9mhiqqhhccadlrx2xv6d3lm7";
        };
        name = "usocket";
        archiveName = "usocket-0.8.3.tgz";
        archiveSize = 85851;
        archiveMD5 = "b1103034f32565487ab3b6eb92c0ca2b";
        archiveContentSHA1 = "12cc3af115d1d393cad4eae8e9b3e3aa123617ed";
        prefix = "usocket-0.8.3";
        systemFiles = [
          "usocket.asd"
        ];
      };
      "xsubseq" = {
        archive = fetchurl {
          url = "http://beta.quicklisp.org/archive/xsubseq/2017-08-30/xsubseq-20170830-git.tgz";
          sha256 = "1am63wkha97hyvkqf4ydx3q07mqpa0chkx65znr7kmqi83a8waml";
        };
        name = "xsubseq";
        archiveName = "xsubseq-20170830-git.tgz";
        archiveSize = 4006;
        archiveMD5 = "960bb8f329649b6e4b820e065e6b38e8";
        archiveContentSHA1 = "77ef22871e590349e22e892cd8f80121db1b1566";
        prefix = "xsubseq-20170830-git";
        systemFiles = [
          "xsubseq.asd"
        ];
      };
    };
  qlSystems =
    {
      "alexandria" = {
        release = qlReleases."alexandria";
        name = "alexandria";
        systemFileName = "alexandria";
        requiredSystems = [
        ];
      };
      "array-utils" = {
        release = qlReleases."array-utils";
        name = "array-utils";
        systemFileName = "array-utils";
        requiredSystems = [
        ];
      };
      "asdf" = {
        release = qlReleases."uiop";
        name = "asdf";
        systemFileName = "uiop";
        requiredSystems = [
        ];
      };
      "babel" = {
        release = qlReleases."babel";
        name = "babel";
        systemFileName = "babel";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."trivial-features"
        ];
      };
      "bordeaux-threads" = {
        release = qlReleases."bordeaux-threads";
        name = "bordeaux-threads";
        systemFileName = "bordeaux-threads";
        requiredSystems = [
          qlSystems."alexandria"
        ];
      };
      "cffi" = {
        release = qlReleases."cffi";
        name = "cffi";
        systemFileName = "cffi";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."babel"
          qlSystems."trivial-features"
        ];
      };
      "cffi-grovel" = {
        release = qlReleases."cffi";
        name = "cffi-grovel";
        systemFileName = "cffi-grovel";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."cffi"
          qlSystems."cffi-toolchain"
        ];
      };
      "cffi-toolchain" = {
        release = qlReleases."cffi";
        name = "cffi-toolchain";
        systemFileName = "cffi-toolchain";
        requiredSystems = [
          qlSystems."cffi"
        ];
      };
      "chipz" = {
        release = qlReleases."chipz";
        name = "chipz";
        systemFileName = "chipz";
        requiredSystems = [
        ];
      };
      "chunga" = {
        release = qlReleases."chunga";
        name = "chunga";
        systemFileName = "chunga";
        requiredSystems = [
          qlSystems."trivial-gray-streams"
        ];
      };
      "cl+ssl" = {
        release = qlReleases."cl+ssl";
        name = "cl+ssl";
        systemFileName = "cl+ssl";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."bordeaux-threads"
          qlSystems."cffi"
          qlSystems."flexi-streams"
          qlSystems."trivial-features"
          qlSystems."trivial-garbage"
          qlSystems."trivial-gray-streams"
          qlSystems."usocket"
        ];
      };
      "cl-base64" = {
        release = qlReleases."cl-base64";
        name = "cl-base64";
        systemFileName = "cl-base64";
        requiredSystems = [
        ];
      };
      "cl-change-case" = {
        release = qlReleases."cl-change-case";
        name = "cl-change-case";
        systemFileName = "cl-change-case";
        requiredSystems = [
          qlSystems."cl-ppcre"
          qlSystems."cl-ppcre-unicode"
        ];
      };
      "cl-cookie" = {
        release = qlReleases."cl-cookie";
        name = "cl-cookie";
        systemFileName = "cl-cookie";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."cl-ppcre"
          qlSystems."local-time"
          qlSystems."proc-parse"
          qlSystems."quri"
        ];
      };
      "cl-ppcre" = {
        release = qlReleases."cl-ppcre";
        name = "cl-ppcre";
        systemFileName = "cl-ppcre";
        requiredSystems = [
        ];
      };
      "cl-ppcre-unicode" = {
        release = qlReleases."cl-ppcre";
        name = "cl-ppcre-unicode";
        systemFileName = "cl-ppcre-unicode";
        requiredSystems = [
          qlSystems."cl-ppcre"
          qlSystems."cl-unicode"
        ];
      };
      "cl-reexport" = {
        release = qlReleases."cl-reexport";
        name = "cl-reexport";
        systemFileName = "cl-reexport";
        requiredSystems = [
          qlSystems."alexandria"
        ];
      };
      "cl-unicode" = {
        release = qlReleases."cl-unicode";
        name = "cl-unicode";
        systemFileName = "cl-unicode";
        requiredSystems = [
          qlSystems."cl-ppcre"
        ];
      };
      "cl-unicode/base" = {
        release = qlReleases."cl-unicode";
        name = "cl-unicode/base";
        systemFileName = "cl-unicode";
        requiredSystems = [
          qlSystems."cl-ppcre"
        ];
      };
      "cl-utilities" = {
        release = qlReleases."cl-utilities";
        name = "cl-utilities";
        systemFileName = "cl-utilities";
        requiredSystems = [
        ];
      };
      "clss" = {
        release = qlReleases."clss";
        name = "clss";
        systemFileName = "clss";
        requiredSystems = [
          qlSystems."array-utils"
          qlSystems."plump"
        ];
      };
      "dexador" = {
        release = qlReleases."dexador";
        name = "dexador";
        systemFileName = "dexador";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."babel"
          qlSystems."bordeaux-threads"
          qlSystems."chipz"
          qlSystems."chunga"
          qlSystems."cl+ssl"
          qlSystems."cl-base64"
          qlSystems."cl-cookie"
          qlSystems."cl-ppcre"
          qlSystems."cl-reexport"
          qlSystems."fast-http"
          qlSystems."fast-io"
          qlSystems."quri"
          qlSystems."trivial-features"
          qlSystems."trivial-gray-streams"
          qlSystems."trivial-mimes"
          qlSystems."usocket"
        ];
      };
      "documentation-utils" = {
        release = qlReleases."documentation-utils";
        name = "documentation-utils";
        systemFileName = "documentation-utils";
        requiredSystems = [
          qlSystems."trivial-indent"
        ];
      };
      "fast-http" = {
        release = qlReleases."fast-http";
        name = "fast-http";
        systemFileName = "fast-http";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."babel"
          qlSystems."cl-utilities"
          qlSystems."proc-parse"
          qlSystems."smart-buffer"
          qlSystems."xsubseq"
        ];
      };
      "fast-io" = {
        release = qlReleases."fast-io";
        name = "fast-io";
        systemFileName = "fast-io";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."static-vectors"
          qlSystems."trivial-gray-streams"
        ];
      };
      "flexi-streams" = {
        release = qlReleases."flexi-streams";
        name = "flexi-streams";
        systemFileName = "flexi-streams";
        requiredSystems = [
          qlSystems."trivial-gray-streams"
        ];
      };
      "form-fiddle" = {
        release = qlReleases."form-fiddle";
        name = "form-fiddle";
        systemFileName = "form-fiddle";
        requiredSystems = [
          qlSystems."documentation-utils"
        ];
      };
      "local-time" = {
        release = qlReleases."local-time";
        name = "local-time";
        systemFileName = "local-time";
        requiredSystems = [
        ];
      };
      "lquery" = {
        release = qlReleases."lquery";
        name = "lquery";
        systemFileName = "lquery";
        requiredSystems = [
          qlSystems."array-utils"
          qlSystems."clss"
          qlSystems."form-fiddle"
          qlSystems."plump"
        ];
      };
      "plump" = {
        release = qlReleases."plump";
        name = "plump";
        systemFileName = "plump";
        requiredSystems = [
          qlSystems."array-utils"
          qlSystems."documentation-utils"
        ];
      };
      "proc-parse" = {
        release = qlReleases."proc-parse";
        name = "proc-parse";
        systemFileName = "proc-parse";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."babel"
        ];
      };
      "quri" = {
        release = qlReleases."quri";
        name = "quri";
        systemFileName = "quri";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."babel"
          qlSystems."cl-utilities"
          qlSystems."split-sequence"
        ];
      };
      "smart-buffer" = {
        release = qlReleases."smart-buffer";
        name = "smart-buffer";
        systemFileName = "smart-buffer";
        requiredSystems = [
          qlSystems."flexi-streams"
          qlSystems."xsubseq"
        ];
      };
      "split-sequence" = {
        release = qlReleases."split-sequence";
        name = "split-sequence";
        systemFileName = "split-sequence";
        requiredSystems = [
        ];
      };
      "static-vectors" = {
        release = qlReleases."static-vectors";
        name = "static-vectors";
        systemFileName = "static-vectors";
        requiredSystems = [
          qlSystems."alexandria"
          qlSystems."cffi"
          qlSystems."cffi-grovel"
        ];
      };
      "str" = {
        release = qlReleases."cl-str";
        name = "str";
        systemFileName = "str";
        requiredSystems = [
          qlSystems."cl-change-case"
          qlSystems."cl-ppcre"
          qlSystems."cl-ppcre-unicode"
        ];
      };
      "trivial-features" = {
        release = qlReleases."trivial-features";
        name = "trivial-features";
        systemFileName = "trivial-features";
        requiredSystems = [
        ];
      };
      "trivial-garbage" = {
        release = qlReleases."trivial-garbage";
        name = "trivial-garbage";
        systemFileName = "trivial-garbage";
        requiredSystems = [
        ];
      };
      "trivial-gray-streams" = {
        release = qlReleases."trivial-gray-streams";
        name = "trivial-gray-streams";
        systemFileName = "trivial-gray-streams";
        requiredSystems = [
        ];
      };
      "trivial-indent" = {
        release = qlReleases."trivial-indent";
        name = "trivial-indent";
        systemFileName = "trivial-indent";
        requiredSystems = [
        ];
      };
      "trivial-mimes" = {
        release = qlReleases."trivial-mimes";
        name = "trivial-mimes";
        systemFileName = "trivial-mimes";
        requiredSystems = [
        ];
      };
      "uiop" = {
        release = qlReleases."uiop";
        name = "uiop";
        systemFileName = "uiop";
        requiredSystems = [
        ];
      };
      "unix-opts" = {
        release = qlReleases."unix-opts";
        name = "unix-opts";
        systemFileName = "unix-opts";
        requiredSystems = [
        ];
      };
      "usocket" = {
        release = qlReleases."usocket";
        name = "usocket";
        systemFileName = "usocket";
        requiredSystems = [
          qlSystems."split-sequence"
        ];
      };
      "xsubseq" = {
        release = qlReleases."xsubseq";
        name = "xsubseq";
        systemFileName = "xsubseq";
        requiredSystems = [
        ];
      };
    };
in { inherit qlSystems qlReleases; }
