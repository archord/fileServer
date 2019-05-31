# -*- coding: utf-8 -*-
import requests
import traceback
from datetime import datetime

        
def crossTaskUpload(path, fnames, comments, serverIP):
    
    try:
        #http://localhost:8080/fs/manualFileUpload.action
        turl = "http://%s:8080/fs/manualFileUpload.action"%(serverIP)
        
        #sendTime = datetime.strftime(datetime.now(), "%Y%m%d%H%M%S")
        values = {'comments': comments}
        files = []
        
        for tfname in fnames:
            tpath = "%s/%s"%(path, tfname)
            files.append(('fileUpload', (tfname,  open(tpath,'rb'), 'text/plain')))
        
        msgSession = requests.Session()
        r = msgSession.post(turl, files=files, data=values)
        
        print(r.text)
    except Exception as e:
        tstr = traceback.format_exc()
        print(tstr)

def crossTaskUploadTest():
    
    serverIP = '10.36.1.77'
    ''' '''
    comments = 'file upload test'
    path = 'data'
    fnames = ['aa3.png','otQuery.txt']
    crossTaskUpload(path, fnames, comments, serverIP)
    
    
        
if __name__ == "__main__":
    
    crossTaskUploadTest()