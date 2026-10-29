import os
from typing import cast

from telegram import Update, Message
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes


async def hello(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(f'Hello')

app = ApplicationBuilder().token(cast(str, os.environ.get("BOT_API_KEY"))).build()

app.add_handler(CommandHandler("hello", hello))

app.run_polling()