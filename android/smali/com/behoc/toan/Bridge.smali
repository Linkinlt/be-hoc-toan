.class public Lcom/behoc/toan/Bridge;
.super Ljava/lang/Object;

.field private final act:Lcom/behoc/toan/MainActivity;

.method public constructor <init>(Lcom/behoc/toan/MainActivity;)V
    .registers 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/behoc/toan/Bridge;->act:Lcom/behoc/toan/MainActivity;
    return-void
.end method

.method public speak(Ljava/lang/String;FF)V
    .registers 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    iget-object v0, p0, Lcom/behoc/toan/Bridge;->act:Lcom/behoc/toan/MainActivity;
    invoke-virtual {v0, p1, p2, p3}, Lcom/behoc/toan/MainActivity;->speak(Ljava/lang/String;FF)V
    return-void
.end method

.method public load()Ljava/lang/String;
    .registers 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    iget-object v0, p0, Lcom/behoc/toan/Bridge;->act:Lcom/behoc/toan/MainActivity;
    const-string v1, "behoc"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Lcom/behoc/toan/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "data"
    const-string v2, ""
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public save(Ljava/lang/String;)V
    .registers 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    iget-object v0, p0, Lcom/behoc/toan/Bridge;->act:Lcom/behoc/toan/MainActivity;
    const-string v1, "behoc"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Lcom/behoc/toan/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "data"
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    return-void
.end method

.method public exit()V
    .registers 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    iget-object v0, p0, Lcom/behoc/toan/Bridge;->act:Lcom/behoc/toan/MainActivity;
    invoke-virtual {v0}, Lcom/behoc/toan/MainActivity;->finish()V
    return-void
.end method
