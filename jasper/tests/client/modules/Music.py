# -*- coding: utf-8-*-

import re
import webbrowser
from client import notifier

#!/usr/bin/python
from apiclient.discovery import build
from apiclient.errors import HttpError
from oauth2client.tools import argparser

WORDS = ["MUISC"]

DEVELOPER_KEY = "AIzaSyBIB2BTXXOQ8HOqYRbxrxASjdvEJkwnxxA"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

def youtube_search(options):
    youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=DEVELOPER_KEY)
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = youtube.search().list(
        q=options.q,
    	part="id,snippet",
    	maxResults=options.max_results
    ).execute()
    print("테스트3")

    selectId = ""
    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    # for search_result in search_response.get("items", []):
    for search_result in search_response.get("items", []):
    	if search_result["id"]["kind"] == "youtube#video":
	   selectId = search_result["id"]["videoId"]
	   print("****" + selectId)
   	   url ="http://121.187.77.136:8080/testWeb/test.jsp?playLink=" + selectId
    	   print(url)
    	   webbrowser.open(url)
	   break 

def handle(text, mic, profile):
    print("음악 들어옴")
    text = text.replace("노래", "", 1)     
    text = text.replace("틀어 줘", "mp3", 1)

    print("****" + text)

    argparser.add_argument("--q", help="Search term", default=text)
    argparser.add_argument("--max-results", help="Max results", default=25)
    args = argparser.parse_args()


    try:
        youtube_search(args)
    except HttpError, e:
   	print "An HTTP error %d occurred:\n%s" % (e.resp.status, e.content)


def isValid(text):
    #return bool(re.search(r'\bmeaning of life\b', text, re.IGNORECA$
    return bool(re.search(ur"틀어 줘", text, re.UNICODE))
