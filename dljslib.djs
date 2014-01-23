\begingroup
\obeyspaces\obeylines\global\let^^M=\jsR%
\catcode`\"=12%
\gdef\dljsdljslibiii{%
/*
        The Document Level JavaScript Library
        D. P. Story copyright 2001-\the\year
*/
var dljslib = true;
}%
\gdef\dljsdljslibiv{%
function Ck4Products(UserInput)
{
    var re, aR;
    for (var i=0; i<JSf.length; i++)
    {
        re = new RegExp("("+JSf[i]+")(\\\()","g");
        UserInput = UserInput.replace(re, "\\$1@$2");
        re = new RegExp("([\\w\\\)])(\\"+JSf[i]+")(@\\\()","g");
        UserInput = UserInput.replace(re, "$1*$2$3");
    }
    for (var i=0; i<JSc.length; i++)
    {
        re = new RegExp("("+JSc[i]+")","g");
        if ( JSc[i] != "E" ) {
            UserInput = UserInput.replace(re, "\\$1@");
            re = new RegExp("([\\w\\\)])(\\"+JSc[i]+")(@)","g");
        }
    }
    UserInput = UserInput.replace(
        /([\d\)])([A-DF-Za-z\(\\])/g, "$1*$2");
    UserInput = UserInput.replace(/(\))(\d)/g, "$1*$2");
    UserInput = UserInput.replace(/([A-Za-z])([\d\(\\])/g, "$1*$2");
    UserInput = UserInput.replace(/(@)([A-Za-z\d])/g, "$1*$2");
    UserInput = UserInput.replace(/(\\)([A-Za-z]{1,})(@)/g, "$2");
    re = /[A-Za-z]{1,}/g;
    while ( (aR = re.exec(UserInput)) != null)
    {
        for (var i=0; i<JSf.length; i++) if ( aR[0] == JSf[i]) break;
        if ( i < JSf.length ) continue;
        for (var i=0; i<JSc.length; i++) if ( aR[0] == JSc[i]) break;
        if ( i < JSc.length ) continue;
        aR[0] = aR[0].replace(/([A-Za-z])\B/g,"$1*");
        UserInput = UserInput.substring(0,aR.index)
            +aR[0]+UserInput.substring(re.lastIndex);
    }
    return UserInput;
}
function Ck4Exponents(UserInput)
{
    var re, regexp, aP, RightP;
    for (var i=0; (i<JSf.length) && (ok2Continue); i++)
    {
        re = new RegExp(JSf[i]+"\\^");
        while ( re.test(UserInput) && (ok2Continue) )
        {
            regexp = new RegExp(JSf[i]+"\\^\\\(", "g");
            if ( (aP = regexp.exec(UserInput)) != null ) {
                // forward search
                RightP=FindBalP(UserInput,regexp.lastIndex-1,1);
                var offsetExp = RightP-regexp.lastIndex;
                regexp = new RegExp(
                    JSf[i]+"\\^\\(.{"+offsetExp+"}\\)\\\(", "g");
                regexp.lastIndex=0;
                if ( (aP = regexp.exec(UserInput)) != null ) {
                    // forward search
                    RightP=FindBalP(UserInput,regexp.lastIndex-1,1);
                    var offsetArg = RightP - regexp.lastIndex;
                    regexp = new RegExp("("+JSf[i]
                        +")\\^\\((.{"+offsetExp+"})\\)\\((.{"
                        +offsetArg+"})\\)");
                    regexp.lastIndex=0;
                    if (regexp.test(UserInput))
                        UserInput=UserInput.replace(
                            regexp,"(pow($1($3),$2))");
                    else ok2Continue=false;
                    continue;
                }
            }
            regexp = new RegExp(JSf[i]
                +"\\^([a-zA-Z]|[+-]?\\d+\\.?\\d*|[+-]?\\d*\\.?\\d+)"
                +"\\\(","g");
            if ( (aP = regexp.exec(UserInput)) != null ) {
                // forward search
                RightP=FindBalP(UserInput,regexp.lastIndex-1,1);
                regexp = new RegExp("("
                    +JSf[i]+")\\^([a-zA-Z]|[+-]?\\d+"
                    +"\\.?\\d*|[+-]?\\d*\\.?\\d+)\\((.{"
                    +eval(RightP-regexp.lastIndex)+"})\\)");
                regexp.lastIndex=0;
                if (regexp.test(UserInput))
                    UserInput=UserInput.replace(
                        regexp,"(pow($1($3),$2))");
                else ok2Continue=false;
            }
            else ok2Continue=false;
        }
    }
    for (var i=0; (i < JSc.length) && (ok2Continue); i++)
    {
        re = new RegExp(JSc[i]+"\\^", "g");
        while ( re.test(UserInput) && (ok2Continue) )
        {
            re.lastIndex = 0;
            aR = re.exec(UserInput);
            if (UserInput.charAt(re.lastIndex)=='\(') {
                // forward search
                RightP=FindBalP(UserInput,re.lastIndex,1);
                var offsetExp = RightP - re.lastIndex - 1;
                re.lastIndex=0;
                regexp = new RegExp("("+JSc[i]
                    +")\\^\\((.{"+offsetExp+"})\\)");
                if ( regexp.test(UserInput) )
                    UserInput = UserInput.replace(
                        regexp, "(pow($1,$2))");
                else ok2Continue = false;
            }
            else
            {
                re.lastIndex=0;
                regexp = new RegExp("("+JSc[i]
                +")\\^([a-zA-Z]|[+-]?\\d+\\.?\\d*|[+-]?\\d*\\.?\\d+)");
                if (regexp.test(UserInput))
                    UserInput = UserInput.replace(
                        regexp, "(pow($1,$2))");
                else ok2Continue = false;
            }
        }
    }
    return UserInput;
}
}%
\endgroup
\begingroup 
\ccpdftex%
\input{dljscc.def}%
\immediate\pdfobj{ << /S /JavaScript /JS (\dljsdljslibiii) >> }
\xdef\objdljslibiii{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S /JavaScript /JS (\dljsdljslibiv) >> }
\xdef\objdljslibiv{\the\pdflastobj\space0 R}
\endgroup 
\endinput
