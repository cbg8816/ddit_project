const FetchUtils = {
    fetchForText : (url, options)=>{
        return fetch(url, options)
            .then(resp=>{
                if(resp.ok){
                    return resp.text();
                }else{
                    throw new Error(`상태코드 : ${resp.status}, ${resp.statusText}`);
                }
            })
            .catch(err=>console.error(err));
    },
    fetchForJSON : (url, options)=>{
        return fetch(url, options)
            .then(resp=>{
                if(resp.ok){
                    return resp.json();
                }else{
                    throw new Error(`상태코드 : ${resp.status}, ${resp.statusText}`);
                }
            })
            .catch(err=>console.error(err));
    }
}
// FetchUtils.fetchForText("주소", {}).then(txt=>console.log(txt));