%{
    #include<stdio.h>
    #include<string.h>
    int nums=0,other=0,base=2,result=1,ans=0,i=0,j=0,sign=1;
    char op=' ';
%}
%%
[Ww][Ee]+ {
            if(yytext[0]=='w'){
                sign = -1;
            };
            result = 1;
            for(i=1;i<(strlen(yytext));i++){
                if(yytext[i]=='E'){
                    for(j=0;j<i-1;j++){
                        result *= base;
                    }
                    ans += result;
                    result = 1;
                }
            }
            ans = ans * sign;
            
        }
"Are"   {
            op = '=';
        }
[A-Za-z_0-9]    {  printf(yytext); }
[ ] ;
%%
int main() {
yyin = fopen("input.txt","r");
yylex();
printf(" %c %d",op,ans);
}int yywrap() {
    return(1);
}