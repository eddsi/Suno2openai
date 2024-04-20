# -*- coding:utf-8 -*-

from typing import Any, Optional

from pydantic import BaseModel


class Response(BaseModel):
    code: Optional[int] = 0
    msg: Optional[str] = "success"
    data: Optional[Any] = None


class GenerateBase(BaseModel):
    token: str = ""
    cookie: str = ""
    session_id: str = ""
    gpt_description_prompt: str = ""
    prompt: str = ""
    mv: str = ""
    title: str = ""
    tags: str = ""
    continue_at: Optional[str] = None
    continue_clip_id: Optional[str] = None


from pydantic import BaseModel
from typing import List, Optional


class Message(BaseModel):
    role: str
    content: str


class Data(BaseModel):
    model: str
    messages: List[Message]
    stream: Optional[bool] = None
