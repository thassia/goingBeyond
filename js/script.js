document.querySelector('#btn').addEventListener('click',()=>{
    let senha=document.getElementById('senha');

    if (senha.type=='password') {
        senha.type='text';
        document.getElementById('btn').value="Esconder senha"; }

    else { 
        senha.type='password';
        document.getElementById('btn').value="Mostrar senha";}
})