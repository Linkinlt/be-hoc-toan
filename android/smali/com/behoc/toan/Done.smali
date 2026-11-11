.class public Lcom/behoc/toan/Done;
.super Landroid/speech/tts/UtteranceProgressListener;

.field private final act:Lcom/behoc/toan/MainActivity;

.method public constructor <init>(Lcom/behoc/toan/MainActivity;)V
    .registers 2
    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V
    iput-object p1, p0, Lcom/behoc/toan/Done;->act:Lcom/behoc/toan/MainActivity;
    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .registers 2
    return-void
.end method

.method public onDone(Ljava/lang/String;)V
    .registers 4
    const-string v0, "sil"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :skip
    iget-object v0, p0, Lcom/behoc/toan/Done;->act:Lcom/behoc/toan/MainActivity;
    invoke-virtual {v0, p1}, Lcom/behoc/toan/MainActivity;->ttsDone(Ljava/lang/String;)V
    :skip
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .registers 2
    invoke-virtual {p0, p1}, Lcom/behoc/toan/Done;->onDone(Ljava/lang/String;)V
    return-void
.end method
