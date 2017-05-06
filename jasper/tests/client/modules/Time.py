# -*- coding: utf-8-*-
import datetime
import re
from semantic.dates import DateService

WORDS = ["TIME"]


def handle(text, mic, profile):
    """
        Reports the current time based on the user's timezone.

        Arguments:
        text -- user-input, typically transcribed speech
        mic -- used to interact with the user (for both input and output)
        profile -- contains information related to the user (e.g., phone
                   number)
    """

    now = datetime.datetime.now
    service = DateService()
    response = service.convertTime(now)
    mic.say("현재 시각은 %s 입니다." % response)


def isValid(text):
    """
        Returns True if input is related to the time.

        Arguments:
        text -- user-input, typically transcribed speech
    """
    return bool(re.search(ur'몇 시야', text, re.UNICODE))
